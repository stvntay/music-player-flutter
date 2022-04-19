import 'package:music_playlist/module/song_list/data/data_sources/source.dart';
import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/data/models/song.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';
import 'package:music_playlist/module/song_list/domain/repositories/repository.dart';
import 'package:music_playlist/utils/services/error/exception.dart';
import 'package:music_playlist/utils/services/error/failure.dart';

class SongListRepositoryImpl implements SongListRepository {
  final SongListRemoteDataSource dataSource;

  SongListRepositoryImpl({required this.dataSource});

  @override
  Future<List<Song>?> getSongListFromArtist(SongArtistName artistName) async{
    try{
      final result = await dataSource.getSongListFromArtist(artistName);
      return result as List<Song>;
    } on ServerException catch (error){
      throw ServerException(error);
    } on ServerFailure catch (failure){
      throw ServerFailure(failure);
    }
  }

}