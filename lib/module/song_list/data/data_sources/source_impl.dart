import 'dart:convert';
import 'package:music_playlist/module/song_list/data/data_sources/source.dart';
import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/data/models/response.dart';
import 'package:music_playlist/module/song_list/data/models/song.dart';
import 'package:music_playlist/utils/services/error/exception.dart';
import 'package:music_playlist/utils/services/error/failure.dart';
import 'package:music_playlist/utils/services/http/http_service.dart';

import 'path.dart';

class SongListRemoteDataSourceImpl implements SongListRemoteDataSource{
  final HttpService service;

  SongListRemoteDataSourceImpl({required this.service});

  @override
  Future<List<SongData>?> getSongListFromArtist(SongArtistName artist) async{
    try {
     final value = await service.get(path: SongListDataSourcePath.listSearch,
          query: artist.toJson());
      Map<String,dynamic> musics = json.decode(value);
      Response data = Response.fromJson(musics);
     return data.songs;
    }  on ServerException catch (error){
      throw ServerException(error);
    } on ServerFailure catch (failure){
      throw ServerFailure(failure);
    }
  }

}