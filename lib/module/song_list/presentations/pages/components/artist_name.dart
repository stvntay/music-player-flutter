import 'package:flutter/material.dart';
import 'package:music_playlist/utils/constant/font_size.dart';

class SongListArtistName extends StatelessWidget {
  final String name;

  SongListArtistName(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: TextStyle(
          color:  Colors.black,
          fontSize: FontSize.desc,
        )
    );
  }
}
