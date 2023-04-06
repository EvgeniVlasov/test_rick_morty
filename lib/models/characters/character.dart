// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/characters/character_location.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  final int? id;
  final Observable<String>? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final CharacterLocation? origin;
  final CharacterLocation? location;
  final String? image;
  final ObservableList<String>? episode;
  final String? url;
  final String? created;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
