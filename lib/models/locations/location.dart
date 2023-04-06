// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int? id;
  final Observable<String>? name;
  final String? type;
  final String? dimension;
  final ObservableList<String>? residents;
  final String? url;
  final String? created;

  Location(
      {this.id,
      this.name,
      this.type,
      this.dimension,
      this.residents,
      this.url,
      this.created});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
