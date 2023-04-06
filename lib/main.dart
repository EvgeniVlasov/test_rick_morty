import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_test/providers/dio_client.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/repositores/location_service.dart';
import 'package:rick_morty_test/routes/app_routes.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DioClient dioClient = DioClient();
  getIt.registerSingleton<AppRoutes>(AppRoutes());
  final appRoutes = getIt<AppRoutes>();
  getIt.registerSingleton<CharacterService>(
      CharacterService(dioClient, appRoutes));
  getIt.registerSingleton<LocationService>(
      LocationService(dioClient, appRoutes));
  runApp(MyApp(
    appRoutes: appRoutes,
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
