part of '../main.dart';

class FirebaseConfig {
  final StorageProvider storageProvider;

  FirebaseConfig(this.storageProvider);

  static FirebaseMessaging get _firebaseMessaging => FirebaseMessaging.instance;

  static Future firebaseInitializeApp(StorageProvider storageProvider) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    initListeners();
  }

  static Future<void> getFirebaseToken() async {
    final String? tokenFCM = await FirebaseMessaging.instance.getToken();
    debugPrint('tokenFCM: ${tokenFCM ?? 'NULL'}');
  }

  static Future<void> deleteFirebaseToken() =>
      FirebaseMessaging.instance.deleteToken();

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    debugPrint('Handling a background message: ${message.messageId}');
    _handlePushMessage(message.data);
  }

  static void _handlePushMessage(Map<String, dynamic> message) async {
    debugPrint('Message contains data ${message['notification_lazy']}');
    if (message.containsKey('notification_lazy')) {
      final StorageProvider? storageProvider;
      if (getIt.isRegistered<StorageProvider>()) {
        storageProvider = getIt<StorageProvider>();
      } else {
        storageProvider = await StorageProvider.init();
        getIt.registerSingleton<StorageProvider>(storageProvider);
      }
      await storageProvider.setContentMessageLazy(message['notification_lazy']);
      debugPrint(
          'Message contains notification_lazy ${message['notification_lazy']}');
    }
    if (message.containsKey('routes')) {
      final AppRoutes? appRoutes;
      if (getIt.isRegistered<AppRoutes>()) {
        appRoutes = getIt<AppRoutes>();
      } else {
        appRoutes = AppRoutes();
        getIt.registerSingleton<AppRoutes>(appRoutes);
      }
      final Map<String, dynamic> routesMap = jsonDecode(message['routes']);
      if (routesMap.containsKey('locations')) {
        appRoutes.replace(LocationsRoute());
      }
    } else {
      debugPrint('Message deep_link is empty');
    }
  }

  static void initListeners() {
    getFirebaseToken();
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _handlePushMessage(event.data);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Message data: ${message.notification!.title}');
      if (Platform.isAndroid) {
        showOverlayNotification((context) => NotificationAndroidWidget(
            remoteNotification: message.notification!));
      }
    });
    _handleInitialPushMessage();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void _handleInitialPushMessage() async {
    var message = await _firebaseMessaging.getInitialMessage();
    if (message != null) {
      FirebaseConfig._handlePushMessage(message.data);
    }
  }
}
