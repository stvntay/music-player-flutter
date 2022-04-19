import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';

abstract class SongListRepository{
  Future<List<Song>?> getSongListFromArtist(SongArtistName artistName);
}