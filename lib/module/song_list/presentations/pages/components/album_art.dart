import 'package:flutter/material.dart';
import 'package:music_playlist/utils/constant/widget_size.dart';

class SongListAlbumArt extends StatelessWidget {
  final String url;

  SongListAlbumArt({required this.url}) ;

  @override
  Widget build(BuildContext context) {
    return (url.isNotEmpty) ?
    FadeInImage(
      image: NetworkImage(url),
      placeholder: Image.asset('assets/default_image.png').image,
      width: WidgetSize.songImageWidthSize,
      height: WidgetSize.songImageHeightSize,
      fit: BoxFit.fitWidth,
    )
        :
    Image.asset('assets/default_image.png',
      width: WidgetSize.songImageWidthSize,
      height: WidgetSize.songImageHeightSize,
      fit: BoxFit.fitWidth,);


  }
}
