import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/player/back_button.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/player/next_button.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/player/pause_button.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/player/play_button.dart';
import 'package:music_playlist/module/song_list/presentations/providers/player_provider.dart';
import 'package:music_playlist/utils/constant/spacing.dart';
import 'package:provider/provider.dart';

class PlayerButtonLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
        builder: (context, playerProvider, child) {
          return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PlayerBackButton(),
            SizedBox(width: Spacing.horizontal,),
            (!playerProvider.isPlaying!) ?
            PlayerPlayButton()
                :
            PlayerPauseButton(),
            SizedBox(width: Spacing.horizontal,),
            PlayerNextButton()
          ],
        );
      }
    );
  }
}
