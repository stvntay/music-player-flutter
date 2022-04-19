import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/presentations/providers/player_provider.dart';
import 'package:provider/provider.dart';

class PlayerPauseButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          Provider.of<PlayerProvider>(context, listen: false)
              .pauseSong();
    },
        icon: const Icon(Icons.pause));
  }
}
