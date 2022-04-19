import 'package:flutter/material.dart';
import 'package:music_playlist/config/routes/route_config.dart';

import 'config/routes/routes.dart';
import 'injection.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RouteConfig.mainPage,
    routes: routesList,
  ));
}
