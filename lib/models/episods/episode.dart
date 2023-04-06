// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  final int? id;
  final Observable<String>? name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? episode;
  final ObservableList<String>? characters;
  final String? url;
  final String? created;

  Episode(
      {this.id,
      this.name,
      this.airDate,
      this.episode,
      this.characters,
      this.url,
      this.created});

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
//{
//       "id": 1,
//       "name": "Pilot",
//       "air_date": "December 2, 2013",
//       "episode": "S01E01",
//       "characters": [
//         "https://rickandmortyapi.com/api/character/1",
//         "https://rickandmortyapi.com/api/character/2",
//         //...
//       ],
//       "url": "https://rickandmortyapi.com/api/episode/1",
//       "created": "2017-11-10T12:56:33.798Z"
//     },
