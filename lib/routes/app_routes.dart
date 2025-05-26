import '/core/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String dashboard = '/dashboard';
  static const String onboarding = '/onboarding';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: language,
      page: () => LanguageScreen(),
      bindings: [LanguageBinding()],
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingScreen(),
      bindings: [OnboardingBinding()],
    ),
    // GetPage(name: welcome, page: () => WelcomeScreen(), bindings: []),
    // GetPage(name: dashboard, page: () => DashboardScreen(), bindings: []),
    // GetPage(name: scan, page: () => ScanScreen(), bindings: []),
  ];
}
