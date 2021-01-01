import 'package:flutter/material.dart';
// import 'screens/MainScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/splashScreen.dart';
// import 'screens/loginScreen.dart';

var routes = <String, WidgetBuilder>{
  "/": (context) => SplashScreen(),
  "/Home": (context) => HomeScreen(),
  // "/Main": (context) => MainScreen(),
};
