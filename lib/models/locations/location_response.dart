// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/locations/location.dart';
import 'package:rick_morty_test/models/response_info.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse {
  @JsonKey(name: 'info')
  final ResponseInfo? locationInfo;
  @JsonKey(name: 'results')
  final ObservableList<Location>? listLocations;

  LocationResponse({this.locationInfo, this.listLocations});

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
