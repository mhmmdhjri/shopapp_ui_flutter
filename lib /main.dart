import 'package:flutter/material.dart';

import 'routes.dart';
import 'screen/splash/splash_screen.dart';
import 'theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Ecommerce',
      initialRoute: SplashScreen.routeName,
      routes: routes,
      theme: themeData(),
    );
  }
}