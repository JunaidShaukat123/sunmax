import '/core/app_export.dart';

class Preference extends GetxController {
  final props = Props();
  var user = UserData().obs;
  final messaging = FirebaseMessaging.instance;

  static String publishableKey =
      "pk_live_51P9UuSP2COuPjTai3MYzzcnzKL65Lu9OcHuy037rfLwsNOujWSYXC8bfSttTz2Gho0A1VJbjKKfvp5vo9DECFDco00htiB4OZo";

  static String secretKey =
      "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";

  // static String publishableKey =
  //     "pk_test_51P9UuSP2COuPjTaiiMu3M5sYksW1ClhLwGsxBmZwLNClNXyIWJwd3nwNMyubS6GOy2FlhsTvJMcdLL0Wpvs4z7C600m4dd2sHD";

  // static String secretKey =
  //     "sk_test_51P9UuSP2COuPjTaib6y4UhgtnfJk1uOLe1FJC7wNPu0dEwbpnlhRYtiMk0N1kqyj3PrCZhVq5jMxIbTSHv9XO28O00fcplIRdr";

  static String urlScheme = "flutterstripe";

  static String merchantIdentifier = "merchant.flutter.stripe.test";

  String serverKey =
      "BB8dB0bSqxRhyAcsIBLZBXbnhM5UQrzZbsYe4WAJ0LcLZimaxbH_Gti7n0kHxfylNYNSYyVjWsRXYa1UuCBLuZE";

  static String baseUrl = 'http://192.168.1.14:3000';
  // static String baseUrl = 'https://zeilconsultants.com/testapis/public';

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

  @override
  void onReady() {
    super.onReady();
    box.listenable().addListener(() {
      onRefresh();
    });
    onRefresh();
    messaging.onTokenRefresh.listen((token) async {
      await put('fcm_token', token);
    });
  }

  void onRefresh() {
    props.setProcessing();
    dynamic data = box.get('user_data');
    if (data != null) {
      user.value = UserData.fromJson(Map<String, dynamic>.from(data));
      props.setNone(data: user.value);
    } else {
      user.value = UserData();
      props.setNone(data: user.value);
    }
  }

  Box get box => Hive.box(HiveBox.preferences);

  String get version => box.get('version', defaultValue: '');

  String? get role => box.get('role');

  String? get bearer => box.get('token');

  String? get country => box.get('country', defaultValue: 'US');

  String? get fcmToken => box.get('fcm_token');

  bool get onboarding => box.get('onboarding', defaultValue: true);

  String? get accessToken => box.get('access_token');

  String? get projectId => box.get('project_id');

  Language get language => Language.fromBox(box.get('language'));

  bool isAuthorized({Map arguments = const {}}) {
    if (bearer == null) {
      // Get.to(() => SignInScreen(), arguments: arguments);
      return false;
    } else {
      return true;
    }
  }

  Map<String, dynamic> _convertNestedMap(Map<dynamic, dynamic> map) {
    return Map<String, dynamic>.fromEntries(
      map.entries.map((entry) {
        if (entry.value is Map) {
          return MapEntry(entry.key.toString(), _convertNestedMap(entry.value));
        } else if (entry.value is List) {
          return MapEntry(entry.key.toString(), _convertList(entry.value));
        } else {
          return MapEntry(entry.key.toString(), entry.value);
        }
      }),
    );
  }

  List<dynamic> _convertList(List<dynamic> list) {
    return list.map((element) {
      if (element is Map) {
        return _convertNestedMap(element);
      } else {
        return element;
      }
    }).toList();
  }

  Map<String, dynamic> convert(data) {
    return Map<String, dynamic>.fromEntries(
      (data as Map).entries.map((entry) {
        if (entry.value is Map) {
          return MapEntry(entry.key.toString(), _convertNestedMap(entry.value));
        } else if (entry.value is List) {
          return MapEntry(entry.key.toString(), _convertList(entry.value));
        } else {
          return MapEntry(entry.key.toString(), entry.value);
        }
      }),
    );
  }

  Future<bool> put(dynamic key, dynamic value) {
    return box
        .put(key, value)
        .then(
          (res) {
            onRefresh();
            return true;
          },
          onError: (error) {
            console.error(error, trace);
            return false;
          },
        );
  }

  Future<bool> putAll(Map<dynamic, dynamic> entries) {
    return box
        .putAll(entries)
        .then(
          (res) {
            onRefresh();
            return true;
          },
          onError: (error) {
            console.error(error, trace);
            return false;
          },
        );
  }

  Future<bool> clear() {
    bool temp = onboarding;
    String? token = fcmToken;

    return box.clear().then(
      (res) async {
        await put('onboarding', temp);
        await put('fcm_token', token);
        onRefresh();
        return true;
      },
      onError: (error) {
        console.error(error, trace);
        return false;
      },
    );
  }

  Future<void> fetchToken() async {
    String? token = await messaging.getToken() ?? '';
    await put('fcm_token', token);
  }

  Future<void> tryAgain() async {}
}
