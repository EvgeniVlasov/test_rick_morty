// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      locationInfo: json['info'] == null
          ? null
          : ResponseInfo.fromJson(json['info'] as Map<String, dynamic>),
      listLocations: json['results'] != null
          ? ObservableList<Location>.of((json['results'] as List)
              .map((e) => Location.fromJson(e as Map<String, dynamic>)))
          : null,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'info': instance.locationInfo,
      'results': instance.listLocations,
    };
