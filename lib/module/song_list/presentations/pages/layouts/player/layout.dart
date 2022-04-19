import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/presentations/pages/components/player/seek.dart';
import 'package:music_playlist/module/song_list/presentations/pages/layouts/player/button_layout.dart';
import 'package:music_playlist/module/song_list/presentations/providers/player_provider.dart';
import 'package:music_playlist/utils/constant/spacing.dart';
import 'package:music_playlist/utils/constant/widget_size.dart';
import 'package:provider/provider.dart';

class PlayerLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
        builder: (context, playerProvider, child) {
          return (playerProvider.isPlaying != null) ?
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: Container(
              height: WidgetSize.playerHeight,
              padding: EdgeInsets.only(bottom: Spacing.padding),
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  PlayerButtonLayout(),
                  StreamProvider<Duration>(
                      create: (_) => playerProvider.player.positionStream,
                      initialData: const Duration(),
                      builder: (context, child) {
                        return PlayerSeekIndicator(
                            streamPosition: playerProvider
                                .seekSliderValue(Provider.of<Duration>(context).inMilliseconds),
                            maxValue: playerProvider.seekSliderMaxValue,
                            onChanged: (value) async{
                              await playerProvider.seek(Duration(
                                  milliseconds: value.toInt()));
                            });
                      }
                  )

                ],
              ),
            ),
          )
              :
          const SizedBox();
        }
    );
  }
}
