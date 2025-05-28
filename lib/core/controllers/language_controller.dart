import 'package:flutter/material.dart';

import '/core/app_export.dart';

class LanguageController extends GetxController {
  final props = Props<List<Language>>(data: []);
  final propsTranslation = Props<List<Translation>>(data: []);

  RxString selectedLanguage = "en".obs;

  final api = Get.find<Api>();
  final preference = Get.find<Preference>();

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
  void onInit() {
    super.onInit();
    Future.wait([getLanguage()]);
  }

  void onChangeLanguage(String code) {
    selectedLanguage.value = code;
  }

  Future<void> getLanguage() async {
    try {
      props.setProcessing();

      LanguageRequest request = LanguageRequest();

      LanguageResponse response = await api.post(
        data: request.toJson(),
        model: LanguageResponse(),
        path: Endpoints.getLanguages,
      );

      if (response.status) {
        props.setNone(data: response.data);
      } else {
        throw CustomException(response.message);
      }
    } on NoInternetException catch (error) {
      console.error(error, trace);
      props.setError(error: error.message);
    } on CustomException catch (error) {
      console.error(error, trace);
      props.setError(error: error.message);
    } on LanguageResponse catch (error) {
      console.error(error, trace);
      props.setError(error: error.message);
    } catch (error) {
      console.error(error, trace);
      props.setError(error: "$error");
    }
  }

  Future<void> getTranslation(
    Language? language, {
    bool processing = true,
  }) async {
    try {
      propsTranslation.setProcessing();

      TranslationRequest request = TranslationRequest(language: language?.id);

      TranslationResponse response = await api.post(
        processing: processing,
        data: request.toJson(),
        model: TranslationResponse(),
        path: Endpoints.getTranslation,
      );

      if (response.status) {
        List<Translation> collection = response.data;
        Map<String, String> translations = {};
        for (var translation in collection) {
          translations[translation.key ?? ''] = translation.value ?? '';
        }
        await Get.find<AppLocalization>().put(
          language?.code ?? 'en',
          translations,
        );
        propsTranslation.setNone(data: response.data);
      } else {
        throw CustomException(response.message);
      }
    } on NoInternetException catch (error) {
      console.error(error, trace);
      propsTranslation.setError(error: error.message);
    } on CustomException catch (error) {
      console.error(error, trace);
      propsTranslation.setError(error: error.message);
    } on TranslationResponse catch (error) {
      console.error(error, trace);
      propsTranslation.setError(error: error.message);
    } catch (error) {
      console.error(error, trace);
      propsTranslation.setError(error: "$error");
    }
  }

  Future<void> onNext() async {
    try {
      Language? language = props.data.value?.singleWhere(
        (element) => element.code == selectedLanguage.value,
        orElse: () => Language(code: 'en', name: 'English'),
      );

      await getTranslation(language);

      await preference.put('language', language?.toJson());

      await Get.updateLocale(Locale(language?.code ?? 'en'));

      Get.offAllNamed(AppRoutes.onboarding);
    } catch (error) {
      console.error(error, trace);
      props.setError(error: "$error");
    }
  }
}
