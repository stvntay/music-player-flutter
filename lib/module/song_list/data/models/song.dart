import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';
part 'song.g.dart';

@JsonSerializable()
class SongData extends Equatable{
  @JsonKey(name: "trackId")
  int? songId;

  @JsonKey(name: "artistName")
  String? artistName;

  @JsonKey(name: "trackName")
  String? songName;

  @JsonKey(name: "collectionName")
  String? albumName;

  @JsonKey(name: "artworkUrl100")
  String? albumArtUrl;

  @JsonKey(name: "previewUrl")
  String? previewUrl;

  @JsonKey(name : "trackTimeMillis")
  int? songTrackInTimeMillis;

  SongData(this.songId,this.artistName, this.songName, this.albumName, this.albumArtUrl,
      this.previewUrl,this.songTrackInTimeMillis);

  factory SongData.fromJson(Map<String, dynamic> json) => _$SongDataFromJson(json);
  Map<String, dynamic> toJson() => _$SongDataToJson(this);

  Song toEntity() => Song(
      songId ?? 0,
      artistName ?? "",
      songName ?? "",
      albumName ?? "",
      albumArtUrl ?? "",
      previewUrl ?? "",
      songTrackInTimeMillis ?? 0,
  );

  @override
  List<Object?> get props => [
    songId,
    artistName,
    songName,
    albumName,
    albumArtUrl,
    previewUrl,
    songTrackInTimeMillis
  ];
}