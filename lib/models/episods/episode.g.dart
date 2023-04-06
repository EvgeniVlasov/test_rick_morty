// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      id: json['id'] as int?,
      name: json['name'] != null ? Observable(json['name'] as String) : null,
      airDate: json['air_date'] as String?,
      episode: json['episode'] as String?,
      characters: json['characters'] != null
          ? ObservableList<String>.of(
              (json['characters'] as List).map((e) => e as String))
          : null,
      url: json['url'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'name': (instance.name)?.value,
      'air_date': instance.airDate,
      'episode': instance.episode,
      'characters': instance.characters,
      'url': instance.url,
      'created': instance.created,
    };
