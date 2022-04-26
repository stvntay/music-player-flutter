import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:music_playlist/module/song_list/data/data_sources/path.dart';
import 'package:music_playlist/module/song_list/data/data_sources/source_impl.dart';
import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/data/models/response.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';
import 'package:music_playlist/utils/services/error/exception.dart';

import '../../../utils/json_reader.dart';
import '../../../utils/service/http_service_test.mocks.dart';


void main(){

  late MockHttpService mockHttpService;
  late SongListRemoteDataSourceImpl remoteDataSourceImpl;

  setUp((){
    mockHttpService = MockHttpService();
    remoteDataSourceImpl = SongListRemoteDataSourceImpl(service: mockHttpService);
  });

  group('get song list based on artist name', (){
    final SongArtistName tArtistName = SongArtistName("Justin Bieber");
    final tResponse = readJson('song_list/response_dummy_data.json');
    test('should return list of song data', () async{
      // arrange
      when(
        mockHttpService.get(path: SongListDataSourcePath.listSearch,
            query: tArtistName.toJson())
      ).thenAnswer((_) async => tResponse);

      // act
      final result = await remoteDataSourceImpl.getSongListFromArtist(tArtistName);

      // assert
      expect(result, equals(Response.fromJson(json.decode(tResponse)).songs));
    });

    test('should throw Server Exception', () async{
      final throwResult = ServerException("Error");
      when(
          mockHttpService.get(path: SongListDataSourcePath.listSearch,
              query: tArtistName.toJson())
      ).thenThrow(throwResult);

      expect(() => remoteDataSourceImpl.getSongListFromArtist(tArtistName), throwsA(isA<ServerException>()));
    });
  });

}