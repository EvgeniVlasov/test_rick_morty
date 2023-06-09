// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'] as int?,
      name: json['name'] != null ? Observable(json['name'] as String) : null,
      type: json['type'] as String?,
      dimension: json['dimension'] as String?,
      residents: json['residents'] != null
          ? ObservableList<String>.of(
              (json['residents'] as List).map((e) => e as String))
          : null,
      url: json['url'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name': (instance.name)?.value,
      'type': instance.type,
      'dimension': instance.dimension,
      'residents': instance.residents,
      'url': instance.url,
      'created': instance.created,
    };
