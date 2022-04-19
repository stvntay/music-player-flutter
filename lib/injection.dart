
import 'package:get_it/get_it.dart';
import 'package:music_playlist/module/song_list/data/data_sources/source.dart';
import 'package:music_playlist/module/song_list/data/data_sources/source_impl.dart';
import 'package:music_playlist/module/song_list/data/repositories/repository_impl.dart';
import 'package:music_playlist/module/song_list/domain/use_cases/get_song_list.dart';
import 'package:music_playlist/module/song_list/presentations/providers/player_provider.dart';
import 'package:music_playlist/module/song_list/presentations/providers/song_list_provider.dart';
import 'package:music_playlist/utils/services/http/http_service.dart';

import 'module/song_list/domain/repositories/repository.dart';

final locator = GetIt.instance;
void init() {
  /// Provider
  locator.registerFactory(() => SongListProvider(locator()));
  locator.registerFactory(() => PlayerProvider());

  /// Usecase
  locator.registerLazySingleton(() => GetSongList(locator()));

  /// Repository
  locator.registerLazySingleton<SongListRepository>(
          () => SongListRepositoryImpl(dataSource: locator()));

  /// Data Source
  locator.registerLazySingleton<SongListRemoteDataSource>(
          () => SongListRemoteDataSourceImpl(service: locator()));

  /// Service
  locator.registerLazySingleton(() => HttpService());
}