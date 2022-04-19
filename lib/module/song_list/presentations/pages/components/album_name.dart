import 'package:flutter/material.dart';
import 'package:music_playlist/utils/constant/font_size.dart';

class SongListAlbumName extends StatelessWidget {
  final String name;

  SongListAlbumName(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(name,
      style: TextStyle(
        color: Colors.grey,
        fontSize: FontSize.caption,
      )
    );
  }
}
