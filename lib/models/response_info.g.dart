// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseInfo _$ResponseInfoFromJson(Map<String, dynamic> json) => ResponseInfo(
      count: json['count'] as int?,
      pages: json['pages'] as int?,
      nextPage: json['next'] as String?,
      previousPage: json['prev'] as String?,
    );

Map<String, dynamic> _$ResponseInfoToJson(ResponseInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.nextPage,
      'prev': instance.previousPage,
    };
