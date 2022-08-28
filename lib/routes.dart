import 'package:app/data/models/dish.dart';
import 'package:app/home/about.screen.dart';
import 'package:app/home/dashboard.screen.dart';
import 'package:app/home/detail_dish.screen.dart';
import 'package:app/home/list.dish.screen.dart';
import 'package:app/main.screen.dart';
import 'package:app/splash.screen.dart';
import 'package:app/intro/intro.screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String root = '/root';
  static const String intro = '/intro';

  static const String main = '/main';

  static const String home = '/home';
  static const String about = '/home/about';

  static const String dish = '/dish';
  // detail dish with arguments
  static const String detailDish = '/home/detailDish';


  static final Map<String, Widget Function(BuildContext)> routes = {
    root: (context) => SplashScreen(),
    intro: (context) => IntroScreen(),
    main: (context) => MainScreen(),
    home: (context) => DashboardScreen(),
    about: (context) => AboutScreen(),
    dish: (context) => listDishScreen(),
    detailDish: (context) => DetailDishScreen(dish: ModalRoute.of(context)!.settings.arguments as DishModel),
  };
}

void move(BuildContext context, String route, {bool replace = false, dynamic arguments}) {
  if (replace) {
    Navigator.pushReplacementNamed(context, route, arguments: arguments);
  } else {
    Navigator.pushNamed(context, route, arguments: arguments);
  }
}
