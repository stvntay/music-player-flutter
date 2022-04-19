import 'package:music_playlist/module/song_list/data/models/song.dart';

class Song extends SongData{
  Song(int songId, String artistName, String songName, String albumName,
      String albumArtUrl, String previewUrl, int songTrackInTimeMillis) :
        super(songId, artistName, songName, albumName, albumArtUrl,
          previewUrl, songTrackInTimeMillis);
}