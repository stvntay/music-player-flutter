import 'package:flutter/material.dart';
import 'package:music_playlist/injection.dart' as di;
import 'package:music_playlist/module/song_list/presentations/pages/components/search.dart';
import 'package:music_playlist/module/song_list/presentations/pages/layouts/body.dart';
import 'package:music_playlist/module/song_list/presentations/providers/player_provider.dart';
import 'package:music_playlist/utils/helpers/size_config.dart';
import 'package:provider/provider.dart';

import '../providers/song_list_provider.dart';

class SongListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// Initiate Configuration Size From Screen
    SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SongListProvider>(create: (_) => di.locator<SongListProvider>() ),
        ChangeNotifierProvider<PlayerProvider>(create: (_) => di.locator<PlayerProvider>() ),
      ],
      builder: (context , child){
        return Scaffold(
          appBar: AppBar(
            title: SongListSearchBar(),
          ),
          body: SongListBody(),
        );
      },
    );
  }
}
