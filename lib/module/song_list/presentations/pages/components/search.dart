import 'package:flutter/material.dart';
import 'package:music_playlist/module/song_list/presentations/providers/song_list_provider.dart';
import 'package:music_playlist/utils/constant/spacing.dart';
import 'package:music_playlist/utils/constant/text.dart';
import 'package:music_playlist/utils/constant/widget_size.dart';
import 'package:provider/provider.dart';

class SongListSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<SongListProvider>(builder: (context, songListProvider, child) {
        return Container(
          height: WidgetSize.searchBarHeight,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 0.5,
                    offset: Offset(0, 0.5)
                )
              ]
          ),
          padding: EdgeInsets.fromLTRB(Spacing.horizontal,
              0, Spacing.horizontal, 0),
          child: TextField(
            controller: songListProvider.searchController,
            onChanged: (value) async{
              Provider.of<SongListProvider>(context,listen: false).fetchSong();
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: TextConstant.songListSearchHint,
                icon: Icon(Icons.search)),

          ),
        );
      }
    );
  }
}
