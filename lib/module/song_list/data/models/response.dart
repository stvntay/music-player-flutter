import 'package:json_annotation/json_annotation.dart';
import 'package:music_playlist/module/song_list/data/models/song.dart';
part 'response.g.dart';

@JsonSerializable()
class Response{
  @JsonKey(name: "results")
  List<SongData> songs;

  Response(this.songs);

  factory Response.fromJson(Map<String,dynamic> json) => _$ResponseFromJson(json);
  Map<String,dynamic> toJson() => _$ResponseToJson(this);
}