import 'package:flutter_test/flutter_test.dart';
import 'package:music_playlist/module/song_list/data/data_sources/source.dart';
import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/data/models/song.dart';
import 'package:music_playlist/injection.dart' as di;
import 'package:music_playlist/module/song_list/data/repositories/repository_impl.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';
import 'package:music_playlist/module/song_list/domain/repositories/repository.dart';
import 'package:music_playlist/module/song_list/domain/use_cases/get_song_list.dart';
import 'package:music_playlist/module/song_list/presentations/providers/song_list_provider.dart';

class MockSongListRemoteDataSource extends SongListRemoteDataSource{
  final tArtistName = "Justin Bieber";
  @override
  Future<List<SongData>?> getSongListFromArtist(SongArtistName artistName) async{
    return <Song>[
      SongData(1, "Justin Bieber", "Peaches", "Justice", "https://justin", "https://justin-preview", 100).toEntity(),
      SongData(2, "Justin Bieber", "Ghost", "Justice 2", "https://justin-2", "https://justin-preview-2", 200).toEntity(),
    ];
  }
}

class MockSongListRepository extends SongListRepositoryImpl{
  MockSongListRepository({required SongListRemoteDataSource dataSource}) : super(dataSource: dataSource);

  @override
  Future<List<Song>?> getSongListFromArtist(SongArtistName artistName) async{
    final result = await dataSource.getSongListFromArtist(artistName);
    return result as List<Song>;
  }
}

class MockGetSongList extends GetSongList{
  MockGetSongList(SongListRepository repository) : super(repository);

  @override
  Future<List<Song>?> getSongListFromArtist(SongArtistName artistName) {
    return repository.getSongListFromArtist(artistName);
  }
}

void main(){
  di.init();
  SongListProvider songListProvider = SongListProvider(MockGetSongList(MockSongListRepository(dataSource: MockSongListRemoteDataSource())));

  const tArtistName = "";
  group("Get Initial Song List", (){
    test("song data should be retrieved with default artist name ( Justin Bieber )", (){
      songListProvider.fetchSong(tArtistName);

      expect(songListProvider.song!.length, 2);
      expect(songListProvider.song![0].songId, 1);
      expect(songListProvider.song![1].songId, 2);
      expect(songListProvider.song![0].songName, "Peaches");
      expect(songListProvider.song![1].songName, "Ghost");

    }
    );
  });

  const tSearchedArtistName = "Justin Bieber";
  group("Search Song List by Artist Name", (){
    test("Song data should be retrieved with Justin Bieber as Artist", (){

      songListProvider.searchSongByArtistName(tSearchedArtistName);

      expect(songListProvider.song!.length, 2);
      expect(songListProvider.song![0].songId, 1);
      expect(songListProvider.song![1].songId, 2);
      expect(songListProvider.song![0].songName, "Peaches");
      expect(songListProvider.song![1].songName, "Ghost");
    });
  }
  );




}