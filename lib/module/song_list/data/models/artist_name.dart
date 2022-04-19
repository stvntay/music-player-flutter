import 'package:json_annotation/json_annotation.dart';
part 'artist_name.g.dart';

@JsonSerializable()
class SongArtistName{
  @JsonKey(name: "term")
  String name;

  SongArtistName(this.name);

  factory SongArtistName.fromJson(Map<String,dynamic> json) => _$SongArtistNameFromJson(json);
  Map<String,dynamic> toJson() => _$SongArtistNameToJson(this);
}