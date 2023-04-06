// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'response_info.g.dart';

@JsonSerializable()
class ResponseInfo {
  final int? count;
  final int? pages;
  @JsonKey(name: 'next')
  final String? nextPage;
  @JsonKey(name: 'prev')
  final String? previousPage;

  ResponseInfo({this.count, this.pages, this.nextPage, this.previousPage});

  factory ResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$ResponseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseInfoToJson(this);
}
