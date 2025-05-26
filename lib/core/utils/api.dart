import 'dart:async';

import '/core/app_export.dart';

class Api extends GetxController {
  late final Preference preference;
  late final Connectivities connectivity;

  @override
  void onInit() {
    super.onInit();
    preference = Get.find<Preference>();
    connectivity = Get.find<Connectivities>();
  }

  String get trace {
    final stackTrace = StackTrace.current;
    final frames = stackTrace.toString().split('\n');

    if (frames.length > 1) {
      final callerFrame = frames[1].trim();
      final regex = RegExp(r'#\d+\s+(\S+)\.(\S+)\s+\(.*\)');
      final match = regex.firstMatch(callerFrame);

      if (match != null) {
        final className = match.group(1);
        final methodName = match.group(2);
        return "$className::$methodName";
      } else {
        return "$runtimeType::unknown";
      }
    } else {
      return "$runtimeType::unknown";
    }
  }

  dioException(model, DioException error) {
    List<String> errors = [];
    Response? response = error.response;
    String? message = error.message ?? 'unknown_error'.tr;

    if (response != null) {
      dynamic data = response.data;

      if (data is Map) {
        if (data.containsKey('message')) {
          message = data['message'];
        } else {
          message = error.response?.statusMessage;
        }

        if (data.containsKey('errors')) {
          dynamic temp = data['errors'];

          if (temp is Map) {
            temp.forEach((key, value) {
              if (value is List) {
                for (var e in value) {
                  errors.add(e.toString());
                }
              }
            });
          }

          if (temp is List) {
            for (var e in temp) {
              errors.add(e.toString());
            }
          }

          errors.sort((a, b) => a.length.compareTo(b.length));
          message = errors.map((e) => "\u2022 $e").join('\n');
        }

        throw model.copyWith(message: message);
      }

      throw model.copyWith(message: response.statusMessage);
    }
    throw CustomException(error.message);
  }

  Dio get dio {
    Dio client = Dio();

    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.connectTimeout = Duration(minutes: 60);
          options.receiveTimeout = Duration(minutes: 60);

          Map<String, dynamic> extra = options.extra;
          Map<String, String> headers = {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };

          if (preference.fcmToken != null) {
            headers['fcm_token'] = preference.fcmToken!;
          }

          if (extra.containsKey('path')) {
            String path = extra['path'];
            if (path.startsWith('{{localhost}}')) {
              options.baseUrl = "http://192.168.1.14:3000";
            } else if (path.startsWith('{{fcm.googleapis.com}}')) {
              options.baseUrl =
                  "https://fcm.googleapis.com/v1/projects/${preference.projectId}/messages:send";
              if (preference.bearer != null) {
                headers['Content-Type'] = 'application/json; charset=UTF-8';
                headers['Authorization'] = "Bearer ${preference.accessToken}";
              }
            } else {
              if (preference.bearer != null) {
                headers['Authorization'] = "Bearer ${preference.bearer}";
              }
              options.baseUrl = Preference.baseUrl;
            }
          }

          options.headers = headers;

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );

    client.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        logPrint: (object) {
          console.info(object.toString(), 'Api');
        },
      ),
    );

    return client;
  }

  RequestOptions requestOptions({
    String path = '',
    Map<String, dynamic>? extra,
  }) {
    Map<String, dynamic> extra = {};
    if (path.startsWith('{{localhost}}')) {
      extra = {'path': path};
      path = path.replaceAll('{{localhost}}', '');
    } else if (path.startsWith('{{fcm.googleapis.com}}')) {
      extra = {'path': path};
      path = path.replaceAll('{{fcm.googleapis.com}}', '');
    } else {
      extra = {'path': path};
      path = path.replaceAll('{{base}}', '');
    }
    return RequestOptions(path: path, extra: extra);
  }

  Future<dynamic> get({
    Object? data,
    dynamic model,
    String path = '',
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? headers,
    bool processing = false,
    Map<String, dynamic> query = const {},
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (processing) ProgressDialog.onStart();

      if (!connectivity.isConnected) {
        if (processing) ProgressDialog.onStop();

        throw NoInternetException();
      }

      RequestOptions request = requestOptions(path: path);

      Response response = await dio.get(
        request.path,
        data: data,
        queryParameters: query,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: headers,
          extra: request.extra,
          responseType: responseType,
        ),
      );

      if (response.statusCode! == 401) {
        if (processing) ProgressDialog.onStop();

        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! == 420) {
        if (processing) ProgressDialog.onStop();

        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          return model.transform(response.data, response: response);
        }
        return response;
      } else {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          throw response.data != null
              ? model.transform(response.data, response: response)
              : CustomException();
        }
        throw response.data != null ? response : CustomException();
      }
    } on NoInternetException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'please_check_your_internet_connection');
      rethrow;
    } on UnauthorizedException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'UnauthorizedException');
      rethrow;
    } on CustomException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'CustomException');
      rethrow;
    } on DioException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'DioException');
      throw dioException(model, error);
    } catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'catch');
      rethrow;
    }
  }

  Future<dynamic> post({
    Object? data,
    dynamic model,
    String path = '',
    bool processing = false,
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (processing) ProgressDialog.onStart();

      if (!connectivity.isConnected) {
        if (processing) ProgressDialog.onStop();

        throw NoInternetException();
      }

      RequestOptions request = requestOptions(path: path);

      Response response = await dio.post(
        data: data,
        request.path,
        queryParameters: query,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: headers,
          responseType: responseType,
          extra: request.extra,
        ),
      );

      if (response.statusCode! == 401) {
        if (processing) ProgressDialog.onStop();
        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! == 420) {
        if (processing) ProgressDialog.onStop();

        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          return model.transform(response.data, response: response);
        }
        return response;
      } else {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          throw response.data != null
              ? model.transform(response.data, response: response)
              : CustomException();
        }
        throw response.data != null ? response : CustomException();
      }
    } on NoInternetException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'please_check_your_internet_connection');
      rethrow;
    } on UnauthorizedException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'UnauthorizedException');
      rethrow;
    } on CustomException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'CustomException');
      rethrow;
    } on DioException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'DioException');
      throw dioException(model, error);
    } catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'catch');
      rethrow;
    }
  }

  Future<dynamic> delete({
    Object? data,
    dynamic model,
    String path = '',
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool processing = false,
  }) async {
    try {
      if (processing) ProgressDialog.onStart();

      if (!connectivity.isConnected) {
        if (processing) ProgressDialog.onStop();

        throw NoInternetException();
      }

      RequestOptions request = requestOptions(path: path);

      Response response = await dio.delete(
        data: data,
        request.path,
        queryParameters: query,
        cancelToken: cancelToken,
        options: Options(
          headers: headers,
          responseType: responseType,
          extra: request.extra,
        ),
      );

      if (response.statusCode! == 401) {
        if (processing) ProgressDialog.onStop();

        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! == 420) {
        if (processing) ProgressDialog.onStop();

        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          return model.transform(response.data, response: response);
        }
        return response;
      } else {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          throw response.data != null
              ? model.transform(response.data, response: response)
              : CustomException();
        }
        throw response.data != null ? response : CustomException();
      }
    } on NoInternetException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'please_check_your_internet_connection');
      rethrow;
    } on UnauthorizedException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'UnauthorizedException');
      rethrow;
    } on CustomException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'CustomException');
      rethrow;
    } on DioException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'DioException');
      throw dioException(model, error);
    } catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'catch');
      rethrow;
    }
  }

  Future<dynamic> put({
    Object? data,
    dynamic model,
    String path = '',
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool processing = false,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (processing) ProgressDialog.onStart();

      if (!connectivity.isConnected) {
        if (processing) ProgressDialog.onStop();

        throw NoInternetException();
      }

      RequestOptions request = requestOptions(path: path);

      Response response = await dio.put(
        data: data,
        request.path,
        queryParameters: query,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: headers,
          responseType: responseType,
          extra: request.extra,
        ),
      );

      if (response.statusCode! == 401) {
        if (processing) ProgressDialog.onStop();

        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! == 420) {
        if (processing) ProgressDialog.onStop();

        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          return model.transform(response.data, response: response);
        }
        return response;
      } else {
        if (processing) ProgressDialog.onStop();

        if (model != null) {
          throw response.data != null
              ? model.transform(response.data, response: response)
              : CustomException();
        }
        throw response.data != null ? response : CustomException();
      }
    } on NoInternetException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'please_check_your_internet_connection');
      rethrow;
    } on UnauthorizedException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'UnauthorizedException');
      rethrow;
    } on CustomException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'CustomException');
      rethrow;
    } on DioException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'DioException');
      throw dioException(model, error);
    } catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'catch');
      rethrow;
    }
  }

  Future<Response> download({
    Object? data,
    dynamic savePath,
    Options? options,
    required String path,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool processing = false,
    void Function(int, int)? onReceiveProgress,
    String lengthHeader = Headers.contentLengthHeader,
  }) async {
    try {
      if (processing) ProgressDialog.onStart();

      Dio client = Dio();

      if (!connectivity.isConnected) {
        if (processing) ProgressDialog.onStop();

        throw NoInternetException();
      }

      Response response = await client.download(
        Uri.encodeFull(path),
        savePath,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on NoInternetException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'please_check_your_internet_connection');
      rethrow;
    } on UnauthorizedException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'UnauthorizedException');
      rethrow;
    } on CustomException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'CustomException');
      rethrow;
    } on DioException catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'DioException');
      rethrow;
    } catch (error) {
      if (processing) ProgressDialog.onStop();

      console.trace(error, trace, 'catch');
      rethrow;
    }
  }
}
