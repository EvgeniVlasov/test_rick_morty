// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:rick_morty_test/models/locations/location.dart' as _i10;
import 'package:rick_morty_test/pages/character_details_page/character_details_screen.dart'
    as _i2;
import 'package:rick_morty_test/pages/character_details_page/store/character_details_store.dart'
    as _i9;
import 'package:rick_morty_test/pages/characters_page/characters_screen.dart'
    as _i4;
import 'package:rick_morty_test/pages/episodes_page/episodes_screen.dart'
    as _i3;
import 'package:rick_morty_test/pages/home_page/home_screen.dart' as _i1;
import 'package:rick_morty_test/pages/location_details_page/location_details_screen.dart'
    as _i6;
import 'package:rick_morty_test/pages/locations_page/locations_screen.dart'
    as _i5;

abstract class $AppRoutes extends _i7.RootStackRouter {
  $AppRoutes([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomeScreen(key: args.key),
      );
    },
    CharacterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CharacterDetailsScreen(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    EpisodesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EpisodesScreen(),
      );
    },
    CharactersRoute.name: (routeData) {
      final args = routeData.argsAs<CharactersRouteArgs>(
          orElse: () => const CharactersRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CharactersScreen(key: args.key),
      );
    },
    LocationsRoute.name: (routeData) {
      final args = routeData.argsAs<LocationsRouteArgs>(
          orElse: () => const LocationsRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LocationsScreen(key: args.key),
      );
    },
    LocationDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<LocationDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LocationDetailsScreen(
          key: args.key,
          location: args.location,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<HomeRouteArgs> page =
      _i7.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CharacterDetailsScreen]
class CharacterDetailsRoute
    extends _i7.PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    _i8.Key? key,
    required _i9.CharacterDetailsStore controller,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CharacterDetailsRoute.name,
          args: CharacterDetailsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailsRoute';

  static const _i7.PageInfo<CharacterDetailsRouteArgs> page =
      _i7.PageInfo<CharacterDetailsRouteArgs>(name);
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({
    this.key,
    required this.controller,
  });

  final _i8.Key? key;

  final _i9.CharacterDetailsStore controller;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i3.EpisodesScreen]
class EpisodesRoute extends _i7.PageRouteInfo<void> {
  const EpisodesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          EpisodesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CharactersScreen]
class CharactersRoute extends _i7.PageRouteInfo<CharactersRouteArgs> {
  CharactersRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CharactersRoute.name,
          args: CharactersRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CharactersRoute';

  static const _i7.PageInfo<CharactersRouteArgs> page =
      _i7.PageInfo<CharactersRouteArgs>(name);
}

class CharactersRouteArgs {
  const CharactersRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'CharactersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.LocationsScreen]
class LocationsRoute extends _i7.PageRouteInfo<LocationsRouteArgs> {
  LocationsRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LocationsRoute.name,
          args: LocationsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LocationsRoute';

  static const _i7.PageInfo<LocationsRouteArgs> page =
      _i7.PageInfo<LocationsRouteArgs>(name);
}

class LocationsRouteArgs {
  const LocationsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LocationsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.LocationDetailsScreen]
class LocationDetailsRoute extends _i7.PageRouteInfo<LocationDetailsRouteArgs> {
  LocationDetailsRoute({
    _i8.Key? key,
    required _i10.Location location,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LocationDetailsRoute.name,
          args: LocationDetailsRouteArgs(
            key: key,
            location: location,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationDetailsRoute';

  static const _i7.PageInfo<LocationDetailsRouteArgs> page =
      _i7.PageInfo<LocationDetailsRouteArgs>(name);
}

class LocationDetailsRouteArgs {
  const LocationDetailsRouteArgs({
    this.key,
    required this.location,
  });

  final _i8.Key? key;

  final _i10.Location location;

  @override
  String toString() {
    return 'LocationDetailsRouteArgs{key: $key, location: $location}';
  }
}
