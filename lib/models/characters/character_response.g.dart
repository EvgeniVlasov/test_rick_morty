// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponse _$CharacterResponseFromJson(Map<String, dynamic> json) =>
    CharacterResponse(
      characterInfo: json['info'] == null
          ? null
          : ResponseInfo.fromJson(json['info'] as Map<String, dynamic>),
      listCharacters: json['results'] != null
          ? ObservableList<Character>.of((json['results'] as List)
              .map((e) => Character.fromJson(e as Map<String, dynamic>)))
          : null,
    );

Map<String, dynamic> _$CharacterResponseToJson(CharacterResponse instance) =>
    <String, dynamic>{
      'info': instance.characterInfo,
      'results': instance.listCharacters,
    };
