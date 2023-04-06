// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int?,
      name: json['name'] != null ? Observable(json['name'] as String) : null,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null
          ? null
          : CharacterLocation.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : CharacterLocation.fromJson(
              json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      episode: json['episode'] != null
          ? ObservableList<String>.of(
              (json['episode'] as List).map((e) => e as String))
          : null,
      url: json['url'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': (instance.name)?.value,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };
