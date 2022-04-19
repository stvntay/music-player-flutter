import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/presentations/pages/layouts/player/layout.dart';
import 'package:music_playlist/module/song_list/presentations/pages/layouts/song_list/item.dart';
import 'package:music_playlist/module/song_list/presentations/providers/player_provider.dart';
import 'package:music_playlist/module/song_list/presentations/providers/song_list_provider.dart';
import 'package:music_playlist/utils/constant/spacing.dart';
import 'package:music_playlist/utils/constant/widget_size.dart';
import 'package:provider/provider.dart';

class SongListBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer2<SongListProvider,PlayerProvider>(
        builder: (context,songListProvider,playerProvider,child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                /// Song List Layout
                ListView.builder(
                    padding: EdgeInsets.fromLTRB(Spacing.padding, Spacing.padding,
                        Spacing.padding,
                        (playerProvider.isPlaying != null) ? WidgetSize.playerHeight
                            :
                        Spacing.vertical),
                    itemCount: songListProvider.song!.length,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: Spacing.verticalDoubleSpace),
                        child: GestureDetector(
                          onTap: () => playerProvider.initiatePlaySong(
                              songListProvider.song!, index ,songListProvider.song![index]),
                          child: SongListItem(songListProvider.song![index],
                            isPlaying: playerProvider.isSongPlaying(
                                songListProvider.song![index].songId!),),
                        ),
                      );
                    }
                ),
                /// Player Layout
                PlayerLayout(),
              ],
            ),
          );
        }
    );
  }
}
