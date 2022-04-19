import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/presentations/providers/player_provider.dart';
import 'package:provider/provider.dart';

class PlayerPlayButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          Provider.of<PlayerProvider>(context, listen: false)
              .playSong();
        },
        icon: const Icon(Icons.play_arrow_rounded));
  }
}
