import 'package:auto_route/auto_route.dart';

import 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRoutes extends $AppRoutes {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: CharactersRoute.page, path: '/characters'),
    AutoRoute(page: LocationsRoute.page, path: '/locations'),
    AutoRoute(page: EpisodesRoute.page, path: '/episodes'),
    AutoRoute(page: CharacterDetailsRoute.page, path: '/character_details'),
    AutoRoute(page: LocationDetailsRoute.page, path: '/location_details')
  ];
}
