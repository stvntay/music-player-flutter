import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/domain/entities/song.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/album_art.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/play_indicator.dart';
import 'package:music_playlist/module/song_list/presentations/pages/layouts/song_list/text_layout.dart';
import 'package:music_playlist/utils/constant/spacing.dart';

class SongListItem extends StatelessWidget {
  final Song data;
  final bool? isPlaying;

  SongListItem(this.data,{this.isPlaying = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SongListAlbumArt(url: data.albumArtUrl ?? "-",),
        SizedBox(width: Spacing.horizontal,),
        Expanded(child: SongListItemTextLayout(
          artistName: data.artistName ?? "-",
          albumName: data.albumName ?? "-",
          songName: data.songName ?? "-" ,)
        ),
        SizedBox(width: Spacing.horizontal,),
        (isPlaying!) ?
        SongListPlayIndicator()
            :
        Container()

      ],
    );
  }
}
