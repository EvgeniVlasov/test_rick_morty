// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodesResponse _$EpisodesResponseFromJson(Map<String, dynamic> json) =>
    EpisodesResponse(
      episodeInfo: json['info'] == null
          ? null
          : ResponseInfo.fromJson(json['info'] as Map<String, dynamic>),
      listEpisodes: json['results'] != null
          ? ObservableList<Episode>.of((json['results'] as List)
              .map((e) => Episode.fromJson(e as Map<String, dynamic>)))
          : null,
    );

Map<String, dynamic> _$EpisodesResponseToJson(EpisodesResponse instance) =>
    <String, dynamic>{
      'info': instance.episodeInfo,
      'results': instance.listEpisodes,
    };
