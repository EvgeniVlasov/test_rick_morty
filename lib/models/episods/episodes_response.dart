// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/episods/episode.dart';
import 'package:rick_morty_test/models/response_info.dart';

part 'episodes_response.g.dart';

@JsonSerializable()
class EpisodesResponse {
  @JsonKey(name: 'info')
  final ResponseInfo? episodeInfo;
  @JsonKey(name: 'results')
  final ObservableList<Episode>? listEpisodes;

  EpisodesResponse({this.episodeInfo, this.listEpisodes});

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesResponseToJson(this);
}
