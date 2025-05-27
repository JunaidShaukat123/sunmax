import '/core/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String splash = '/splash';
  static const String become = '/become';
  static const String signin = '/sign_in';
  static const String signup = '/sign_up';
  static const String language = '/language';
  static const String dashboard = '/dashboard';
  static const String onboarding = '/onboarding';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';
  static const String verification = '/verification';

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
    GetPage(
      name: become,
      page: () => BecomeScreen(),
      bindings: [BecomeBinding()],
    ),
    GetPage(
      name: signin,
      page: () => SignInScreen(),
      bindings: [SignInBinding()],
    ),
    GetPage(
      name: signup,
      page: () => SignUpScreen(),
      bindings: [SignUpBinding()],
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPasswordScreen(),
      bindings: [ForgotPasswordBinding()],
    ),
  ];
}
