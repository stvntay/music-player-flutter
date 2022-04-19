import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';

class PlayerProvider extends ChangeNotifier{
  List<Song> playlist = [];
  Song? selectedSong;
  int? songIndex;
  AudioPlayer player = AudioPlayer();
  bool? isPlaying;

  /// Initiate to play song when choose song from the list
  Future initiatePlaySong(List<Song> songList, int index,Song selectedSong) async {
    playlist.clear();
    this.selectedSong = selectedSong;
    songIndex = index;
    playlist.addAll(songList);

    await player.setUrl(playlist[songIndex!].previewUrl!);
    playSong();

  }

  /// Play Song
  void playSong()  {
    isPlaying = true;
    player.play();
    notifyListeners();
  }

  /// Pause Song
  void pauseSong(){
    isPlaying = false;
    player.pause();
    notifyListeners();
  }

  /// Change seek value based on time
  Future seek(Duration time) async {
    await player.seek(time);
  }

  /// Set song seek value
  double seekSliderValue(int duration) {
    double value = 1.toDouble();
    /// When player has null duration (not initiated)
    if(player.duration != null) {
      value = player.duration!.inMilliseconds.toDouble();
    } else {
      value = 1.toDouble();
    }

    /// Check if value is bigger than default duration
    if(value <  duration.toDouble()) {
      value = player.duration!.inMilliseconds.toDouble();
    } else {
      value = duration.toDouble();
    }

    return value;
  }

  /// Get Maximum Time from Song
  double get seekSliderMaxValue => (player.duration != null) ?
    player.duration!.inMilliseconds.toDouble()
        :
    1.toDouble();

  /// Check if the song is playing now
  bool isSongPlaying(int songId){
    return selectedSong != null && (songId == selectedSong!.songId) && isPlaying != null;
  }
}