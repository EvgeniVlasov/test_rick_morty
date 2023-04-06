// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'character_location.g.dart';

@JsonSerializable()
class CharacterLocation {
  CharacterLocation({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterLocationToJson(this);
}
