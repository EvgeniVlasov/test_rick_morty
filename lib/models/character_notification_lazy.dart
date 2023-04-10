// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'character_notification_lazy.g.dart';

@JsonSerializable()
class NotificationCharacterLazy {
  final String? title;
  final String? subtitle;

  NotificationCharacterLazy({this.title = '', this.subtitle = ''});

  factory NotificationCharacterLazy.fromJson(Map<String, dynamic> json) =>
      _$NotificationCharacterLazyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationCharacterLazyToJson(this);
}
