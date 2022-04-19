import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/album_name.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/artist_name.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/song_name.dart';
import 'package:music_playlist/utils/constant/spacing.dart';

class SongListItemTextLayout extends StatelessWidget {
  final String songName;
  final String artistName;
  final String albumName;

  SongListItemTextLayout({
    required this.songName,
    required this.artistName,
    required this.albumName
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SongListName(songName),
        SizedBox(height: Spacing.verticalHalfSpace,),
        SongListArtistName(artistName),
        SizedBox(height: Spacing.verticalHalfSpace,),
        SongListAlbumName(albumName)
      ],
    );
  }
}
