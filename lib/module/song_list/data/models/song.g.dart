// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongData _$SongDataFromJson(Map<String, dynamic> json) {
  return SongData(
    json['trackId'] as int?,
    json['artistName'] as String?,
    json['trackName'] as String?,
    json['collectionName'] as String?,
    json['artworkUrl100'] as String?,
    json['previewUrl'] as String?,
    json['trackTimeMillis'] as int?,
  );
}

Map<String, dynamic> _$SongDataToJson(SongData instance) => <String, dynamic>{
      'trackId': instance.songId,
      'artistName': instance.artistName,
      'trackName': instance.songName,
      'collectionName': instance.albumName,
      'artworkUrl100': instance.albumArtUrl,
      'previewUrl': instance.previewUrl,
      'trackTimeMillis': instance.songTrackInTimeMillis,
    };
