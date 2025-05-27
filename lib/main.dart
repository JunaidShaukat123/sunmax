import 'package:flutter/material.dart';

import '/core/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  await HiveBox.onInit();
  // await HiveBox.onClear();

  await Get.putAsync(() async => PrefUtils());
  await Get.putAsync(() async => Connectivities());
  await Get.find<Connectivities>().onConnect();
  await Get.putAsync(() async => AppLocalization());
  await Get.find<AppLocalization>().byPass();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: theme,
          title: 'Sun Max',
          locale: Get.deviceLocale,
          getPages: AppRoutes.pages,
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBindings(),
          initialRoute: AppRoutes.initialRoute,
          fallbackLocale: const Locale('en'),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
        );
      },
    );
  }
}
