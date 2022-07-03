import 'package:flutter/material.dart';
import 'package:wisataind/src/screen/detail_place.dart';
import 'package:wisataind/src/screen/home.dart';
import 'package:wisataind/src/screen/splash_screen.dart';
import '../utils/route_path.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.SplashScreenRoute:
      return MaterialPageRoute(
          builder: (context) => SplashScreen());
    case routes.HomeScreenRoute:
      return MaterialPageRoute(
          builder: (context) => Home());
    case routes.DetailScreenRoute:
      var list = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => DetailPlace(listWisata: list,));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}