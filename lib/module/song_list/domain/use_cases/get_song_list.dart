import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';
import 'package:music_playlist/module/song_list/domain/repositories/repository.dart';

class GetSongList {
  final SongListRepository repository;

  GetSongList(this.repository);

  Future<List<Song>?> getSongListFromArtist(SongArtistName artistName) {
    return repository.getSongListFromArtist(artistName);
  }

}