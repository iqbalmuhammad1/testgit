import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisataind/locator.dart';
import 'package:wisataind/src/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
  setupLocator();
}

