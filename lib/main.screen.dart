import 'package:app/base_view_model.dart';
import 'package:app/home/about.screen.dart';
import 'package:app/home/dashboard.screen.dart';
import 'package:app/home/favorite.screen.dart';
import 'package:app/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MVVM<MainScreenViewModel>.builder(
      viewModel: MainScreenViewModel(),
      viewBuilder: (context, vm) {
        return Scaffold(
          body: Container(
            child: vm.child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            unselectedItemColor: colorStyle.third,
            selectedItemColor: colorStyle.fourth,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Store',
                icon: Icon(Icons.storefront),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
              ),
            ],
            currentIndex: vm._selectedIndex,
            onTap: (index) {
              vm.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}

class MainScreenViewModel extends ViewModel with BaseViewModel {
  int _selectedIndex = 0;
  Widget child = DashboardScreen();

  double marginLeft = 0;
  double marginRight = 0;

  @override
  void init() {
    super.init();
  }

  void changeIndex(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        child = DashboardScreen();
        break;
      case 1:
        child = FavoriteScreen();
        break;
      case 2:
        child = AboutScreen();
        break;
    }

    notifyListeners();

    print('index: $index, _selectedIndex: $_selectedIndex');

    notifyListeners();
  }
}
