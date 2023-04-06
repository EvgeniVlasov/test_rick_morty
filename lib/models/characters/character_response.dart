// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/models/response_info.dart';
import 'package:mobx/mobx.dart';

part 'character_response.g.dart';

@JsonSerializable()
class CharacterResponse {
  @JsonKey(name: 'info')
  final ResponseInfo? characterInfo;
  @JsonKey(name: 'results')
  final ObservableList<Character>? listCharacters;

  CharacterResponse({this.characterInfo, this.listCharacters});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);
}
