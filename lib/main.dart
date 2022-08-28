import 'package:app/splash.screen.dart';
import 'package:app/routes.dart';
import 'package:app/styles/colors.style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOrengan',
      home: SplashScreen(),
      initialRoute: Routes.root,
      routes: Routes.routes,
    );
  }
}
