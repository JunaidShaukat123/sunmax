import 'dart:async';
import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart';

import '/core/app_export.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  console.log(message.toMap(), 'message');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Handle background notification
  await Get.find<FCM>().showLocalNotification(
    message,
  ); // Access the FCM service
}

class FCM extends GetxService {
  Box box = Hive.box(HiveBox.preferences);

  late String fcmToken;
  late String serviceKey;
  late String projectId;
  late String accessToken;
  late ServiceAccountCredentials credentials;

  final messaging = FirebaseMessaging.instance;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  List<String> scopes = ["https://www.googleapis.com/auth/firebase.messaging"];

  @override
  Future<void> onInit() async {
    super.onInit();
    await requestPermission();
    await initialize();
    await fetchToken();
    await getAccessToken();
    FirebaseMessaging.instance.subscribeToTopic("news");
    FirebaseMessaging.onMessage.listen(onMessage);
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    messaging.onTokenRefresh.listen((token) async {
      fcmToken = token;
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      console.log("Message clicked: ${message.data}");
    });
  }

  Future<void> getAccessToken() async {
    serviceKey = await rootBundle.loadString('assets/service_key.json');
    final credentialsMap = jsonDecode(serviceKey);
    credentials = ServiceAccountCredentials.fromJson(credentialsMap);

    // Extract project_id dynamically
    projectId = credentialsMap["project_id"];

    final client = await clientViaServiceAccount(credentials, scopes);

    accessToken = client.credentials.accessToken.data;

    await box.putAll({'access_token': accessToken, 'project_id': projectId});
  }

  Future<void> fetchToken() async {
    fcmToken = await messaging.getToken() ?? '';
    await box.put('fcm_token', fcmToken);
  }

  // This function will handle the foreground messages
  Future<void> onMessage(RemoteMessage message) async {
    console.log(message.toMap(), 'message');

    Map<String, dynamic> data = message.data;
    if (data.containsKey('broadcast')) {
      Get.find<BroadcasterController>().onBroadcast(data['emits']);
    }

    // Show notification when a message is received
    await showNotification(
      id: 1,
      title: message.notification?.title ?? 'No Title',
      body: message.notification?.body ?? 'No Body',
    );
  }

  // Show local notification when a message is received in the background
  Future<void> showLocalNotification(RemoteMessage message) async {
    if (message.notification != null) {
      _showLocalNotification(message.notification!);
    }
  }

  void _showLocalNotification(RemoteNotification notification) {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'high_importance_channel', // Channel ID
          'High Importance Notifications', // Channel name
          channelDescription: 'description',
          importance: Importance.max,
          priority: Priority.high,
          color: appTheme.transparent,
        );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    flutterLocalNotificationsPlugin.show(
      0,
      notification.title,
      notification.body,
      platformChannelSpecifics,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'high_importance_channel', // Channel ID
          'High Importance Notifications', // Channel name
          channelDescription: 'description',
          importance: Importance.max,
          priority: Priority.high,
          color: appTheme.transparent,
        );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> initialize() async {
    // Firebase initialization
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Android Initialization
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    // iOS Initialization
    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    // Initialization Settings
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettings,
        );

    // Initialize Plugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap here
      },
    );
  }

  Future<void> requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
  }
}
