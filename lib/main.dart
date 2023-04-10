import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:rick_morty_test/providers/dio_client.dart';
import 'package:rick_morty_test/providers/storage_provider.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/repositores/location_service.dart';
import 'package:rick_morty_test/routes/app_routes.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rick_morty_test/extension/firebase_options.dart';
import 'package:rick_morty_test/pages/widgets/notification_android_widget.dart';
import 'package:rick_morty_test/routes/app_routes.gr.dart';

part 'extension/firebase_config.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DioClient dioClient = DioClient();
  final StorageProvider storageProvider = await StorageProvider.init();
  getIt.registerSingleton<StorageProvider>(storageProvider);
  getIt.registerSingleton<AppRoutes>(AppRoutes());
  final appRoutes = getIt<AppRoutes>();
  await FirebaseConfig.firebaseInitializeApp(storageProvider);
  getIt.registerSingleton<CharacterService>(
      CharacterService(dioClient, appRoutes, storageProvider));
  getIt.registerSingleton<LocationService>(
      LocationService(dioClient, appRoutes));
  runApp(OverlaySupport.global(
    child: MyApp(
      appRoutes: appRoutes,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;

  const MyApp({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          appBarTheme:
              const AppBarTheme(centerTitle: true, color: Colors.white38),
          scaffoldBackgroundColor: Colors.white),
      routerConfig: appRoutes.config(),
    );
  }
}
