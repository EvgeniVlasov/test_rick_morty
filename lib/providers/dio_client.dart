import 'package:dio/dio.dart';
import 'package:rick_morty_test/models/characters/character_response.dart';
import 'package:rick_morty_test/models/episods/episodes_response.dart';
import 'package:rick_morty_test/models/locations/location_response.dart';

import 'app_response.dart';

class DioClient {
  Dio? dio;

  DioClient() {
    createDio();
  }

  createDio() {
    dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));
    dio!.interceptors.add(LogInterceptor(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        responseBody: true,
        error: true));
  }

  static const _charactersMethod = 'character/';
  static const _episodesMethod = 'episode/';
  static const _locationsMethod = 'location/';

  Future<AppResponse<CharacterResponse?, Exception>> getCharacters(
      [int? page, String? name]) async {
    Map<String, dynamic>? params = {};
    if (page != null) {
      params.addAll({'page': page.toString()});
    }
    if (name != null) {
      params.addAll({'name': name});
    }
    try {
      final response =
          await dio?.get(_charactersMethod, queryParameters: params);
      return AppResponse.success(
          data: CharacterResponse.fromJson(response?.data));
    } on DioError catch (e) {
      return AppResponse.error(error: e);
    }
  }

  Future<AppResponse<LocationResponse?, Exception>> getLocations(
      [int? page]) async {
    try {
      final response = await dio?.get(_locationsMethod,
          queryParameters: page != null ? {'page': page.toString()} : null);
      return AppResponse.success(
          data: LocationResponse.fromJson(response?.data));
    } on DioError catch (e) {
      return AppResponse.error(error: e);
    }
  }

  Future<AppResponse<EpisodesResponse?, Exception>> getEpisodes(
      [int? page]) async {
    try {
      final response = await dio?.get(_episodesMethod,
          queryParameters: page != null ? {'page': page.toString()} : null);
      return AppResponse.success(
          data: EpisodesResponse.fromJson(response?.data));
    } on DioError catch (e) {
      return AppResponse.error(error: e);
    }
  }
}
