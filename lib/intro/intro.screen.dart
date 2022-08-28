// ignore_for_file: prefer_const_constructors

import 'package:app/base_view_model.dart';
import 'package:app/home/dashboard.screen.dart';
import 'package:app/main.screen.dart';
import 'package:app/routes.dart';
import 'package:app/splash.screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Slide> slides = [];

    BaseViewModel viewModel = BaseViewModel();

    slides.add(
      Slide(
        centerWidget: Text(
          'Be Ready...',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundNetworkImage: "https://picsum.photos/200/300",
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        centerWidget: Text(
          '...To fill...',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundNetworkImage: "https://picsum.photos/200/300",
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        centerWidget: Text(
          '...your tummy !!!',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundNetworkImage: "https://picsum.photos/200/300",
        onCenterItemPress: () {},
      ),
    );

    return IntroSlider(
      slides: slides,
      onDonePress: () async {
        await viewModel.getInstances();
        // set is LoggedIn to true
        viewModel.sharedPref?.setBool(viewModel.argLoggedIn, true);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainScreen()),
          (Route<dynamic> route) => false,
        );
      },
      onSkipPress: () async {
        await viewModel.getInstances();
        // set is LoggedIn to true
        viewModel.sharedPref?.setBool(viewModel.argLoggedIn, true);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainScreen()),
          (Route<dynamic> route) => false,
        );
      },
      autoScroll: true,
      autoScrollInterval: Duration(milliseconds: 2000),
    );
  }
}
