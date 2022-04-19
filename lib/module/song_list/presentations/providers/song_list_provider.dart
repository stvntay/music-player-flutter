import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/data/models/artist_name.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';
import 'package:music_playlist/module/song_list/domain/use_cases/get_song_list.dart';
import 'package:music_playlist/utils/services/error/exception.dart';
import 'package:music_playlist/utils/services/error/failure.dart';

class SongListProvider extends ChangeNotifier{
  final GetSongList getSongList;
  TextEditingController searchController = TextEditingController();
  List<Song>? song = [];
  var isFetchLoading = true;
  Timer? _debounce;

  SongListProvider(this.getSongList) {
    fetchSong();
  }

  /// Change loading state when fetch list of the songs
  void setLoadingState(bool state){
    isFetchLoading = state;
    notifyListeners();
  }

  /// Get Song Based On Artist Name
  void fetchSong() async{
    isFetchLoading = true;
    String artistName = (searchController.text.isEmpty) ? "Justin Bieber" : searchController.text;
    try{
      final result = await getSongList.getSongListFromArtist(SongArtistName(artistName));
      song!.clear();
      song!.addAll(result!);
      isFetchLoading = false;
      notifyListeners();
    } on ServerException catch (error){
      print(error);
    } on ServerFailure catch (failure){
      print(failure);
    }

  }

  /// Search Song & Triggered When Search Bar Value is Changed
  void searchSongByArtistName() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      /// Fetch Song After 1 Second Waiting For Other Changes
      fetchSong();
    });
  }

}