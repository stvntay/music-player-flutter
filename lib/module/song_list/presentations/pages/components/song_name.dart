import 'package:flutter/material.dart';
import 'package:music_playlist/utils/constant/font_size.dart';

class SongListName extends StatelessWidget {
  final String name;

  SongListName(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: TextStyle(
          color:  Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: FontSize.title,
        )
    );
  }
}
