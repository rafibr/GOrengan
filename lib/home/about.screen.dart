// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/base_view_model.dart';
import 'package:app/routes.dart';
import 'package:app/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return MVVM<AboutViewModel>.builder(
      viewModel: AboutViewModel(),
      viewBuilder: (context, vm) {
        return Scaffold(
          appBar: AppBar(title: Text('About', style: TextStyle(color: Colors.black)), backgroundColor: Colors.white),
          // about the developer
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Builded by
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text('Builded by', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                // developer photo
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // developer name
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      // icon name
                      FaIcon(FontAwesomeIcons.user, color: Colors.black, size: 20),
                      SizedBox(width: 10),
                      // name
                      Text('Muhammad Rafi Brilliansyah Ramadhan',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
                // developer email
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      // icon email
                      FaIcon(FontAwesomeIcons.envelope, color: Colors.black, size: 20),
                      SizedBox(width: 10),
                      // email
                      Text('rafi.brilliansyah@gmail.com',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
                // developer github
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      // icon github
                      FaIcon(FontAwesomeIcons.github, color: Colors.black, size: 20),
                      SizedBox(width: 10),
                      // github
                      Text('rafibr',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AboutViewModel extends ViewModel with BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void init() async {
    super.init();

    await getInstances();
  }

  void logout() {
    sharedPref?.setBool(argLoggedIn, false);
    move(context, Routes.root, replace: true);
  }
}
