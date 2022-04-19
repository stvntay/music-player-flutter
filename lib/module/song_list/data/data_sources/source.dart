import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/data/models/song.dart';

abstract class SongListRemoteDataSource{
  Future<List<SongData>?> getSongListFromArtist(SongArtistName artistName);
}