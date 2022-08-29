// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:developer';

import 'package:app/base_view_model.dart';
import 'package:app/data/models/categories.dart';
import 'package:app/data/models/dish.dart';
import 'package:app/home/detail_dish.screen.dart';
import 'package:app/home/list.dish.screen.dart';
import 'package:app/home/list_dish_kategori.screen.dart';
import 'package:app/main.screen.dart';
import 'package:app/routes.dart';
import 'package:app/styles/categoriesCard.dart';
import 'package:app/styles/colors.style.dart';
import 'package:app/styles/dishCard.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MVVM<DashboardViewModel>.builder(
      viewModel: DashboardViewModel(),
      viewBuilder: (context, vm) {
        return Scaffold(
          backgroundColor: Colors.white,
          key: vm.scaffoldKey,
          body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return _buildWebLayout(vm);
            } else {
              return _buildMobileLayout(vm);
            }
          }),
        );
      },
    );
  }

  Widget _buildMobileLayout(DashboardViewModel vm) {
    return RefreshIndicator(
      onRefresh: () async {
        await vm.refresh();
      },
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 75,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.sort,
                        color: colorStyle.secondary,
                        size: 20,
                      ),
                      onPressed: () {
                        vm.search();
                      },
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 45),
                        child: InkWell(
                          onTap: () {
                            vm.search();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Deliver To Icon arrow down
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Antar ke',
                                    style: TextStyle(
                                      color: colorStyle.secondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: colorStyle.secondary,
                                    size: 20,
                                  ),
                                ],
                              ),
                              Text(
                                'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: colorStyle.textLight,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: colorStyle.secondary,
                        size: 20,
                      ),
                      onPressed: () {
                        vm.about();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Makan Apa Hari Ini?',
                      style: TextStyle(
                        color: colorStyle.secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // search bar
                    InkWell(
                      onTap: () {
                        vm.search();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Cari Makanan',
                            hintStyle: TextStyle(
                              color: colorStyle.textLight,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: colorStyle.secondary,
                                width: 1,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: colorStyle.secondary,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Category scroll view horizontal
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kategori',
                            style: TextStyle(
                              color: colorStyle.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vm.categories.length,
                        itemBuilder: (context, index) {
                          return CategoriesCard(
                            categories: vm.categories[index],
                            onTap: () {
                              vm.listDishByCategories(vm.categories[index]);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // list makanan
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Makanan',
                            style: TextStyle(
                              color: colorStyle.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Lihat Semua',
                              style: TextStyle(
                                color: colorStyle.secondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              vm.listDishByCategories(vm.categories[0]);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // list makanan
                    Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: vm.makanan.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          return DishCard(
                            dish: vm.makanan[index],
                            onLike: () {
                              vm.like(vm.makanan[index]);
                            },
                            onTap: () {
                              vm.detailDish(vm.makanan[index]);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // web layout
  Widget _buildWebLayout(DashboardViewModel vm) {
    return RefreshIndicator(
        onRefresh: () async {
          await vm.refresh();
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 75,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.sort,
                          color: colorStyle.secondary,
                          size: 20,
                        ),
                        onPressed: () {
                          vm.search();
                        },
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          child: InkWell(
                            onTap: () {
                              vm.search();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Deliver To Icon arrow down
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Antar ke',
                                      style: TextStyle(
                                        color: colorStyle.secondary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: colorStyle.secondary,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                Text(
                                  'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: colorStyle.textLight,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.person,
                          color: colorStyle.secondary,
                          size: 20,
                        ),
                        onPressed: () {
                          vm.about();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Makan Apa Hari Ini?',
                        style: TextStyle(
                          color: colorStyle.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // search bar
                      InkWell(
                        onTap: () {
                          vm.search();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Cari Makanan',
                              hintStyle: TextStyle(
                                color: colorStyle.textLight,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: colorStyle.secondary,
                                  width: 1,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: colorStyle.secondary,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Category scroll view horizontal
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kategori',
                              style: TextStyle(
                                color: colorStyle.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.categories.length,
                          itemBuilder: (context, index) {
                            return CategoriesCard(
                              categories: vm.categories[index],
                              onTap: () {
                                vm.listDishByCategories(vm.categories[index]);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // list makanan
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Makanan',
                              style: TextStyle(
                                color: colorStyle.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  color: colorStyle.secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                vm.listDishByCategories(vm.categories[0]);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // list makanan
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: vm.makanan.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1 / 1.5,
                          ),
                          itemBuilder: (context, index) {
                            return DishCard(
                              dish: vm.makanan[index],
                              onLike: () {
                                vm.like(vm.makanan[index]);
                              },
                              onTap: () {
                                vm.detailDish(vm.makanan[index]);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class DashboardViewModel extends ViewModel with BaseViewModel {
  // make screen size variable
  double screenWidth = 0;
  String screenType = 'small';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<CategoriesModel> categories = [];
  List<DishModel> makanan = [];
  List<DishModel> minuman = [];
  List<DishModel> cemilan = [];

  @override
  void init() async {
    super.init();
    await getInstances();

    categories = categoriesData;

    makanan = dishData.where((element) => element.categoryId == 1).toList();
    makanan.shuffle();
    makanan = makanan.sublist(0, 4);

    minuman = dishData.where((element) => element.categoryId == 2).toList();
    minuman.shuffle();
    minuman = minuman.sublist(0, 4);

    cemilan = dishData.where((element) => element.categoryId == 3).toList();
    cemilan.shuffle();
    cemilan = cemilan.sublist(0, 4);

    // get screen size
    screenWidth = MediaQuery.of(context).size.width;
    // check screen size
    if (screenWidth < 600) {
      screenType = 'small';
    } else if (screenWidth < 900) {
      screenType = 'medium';
    } else {
      screenType = 'large';
    }

    notifyListeners();
  }

  // on resume
  @override
  void onResume() {
    super.onResume();
    init();
  }

  Future<void> refresh() async {
    init();

    // delay for refresh
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }

  void search() {
    // move(context, Routes.dish);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => listDishScreen(),
      ),
    );
  }

  void logout() {
    sharedPref?.setBool(argLoggedIn, false);
    move(context, Routes.root, replace: true);
  }

  void like(DishModel makanan) {
    makanan.isFavorite = !makanan.isFavorite;
    notifyListeners();
  }

  void detailDish(DishModel makanan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailDishScreen(
          dish: makanan,
        ),
      ),
    );
  }

  void listDishByCategories(CategoriesModel categori) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => listDishKategoriScreen(
          categories: categori,
        ),
      ),
    );
  }

  void about() {
    // change tab index on MainScreenViewModel
    MainScreenViewModel vm = getViewModel();
    vm.changeIndex(2);
  }

  MainScreenViewModel getViewModel() {
    return Provider.of<MainScreenViewModel>(context, listen: false);
  }
}
