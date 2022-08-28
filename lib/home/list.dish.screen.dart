// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:developer';

import 'package:app/base_view_model.dart';
import 'package:app/data/helper.dart';
import 'package:app/data/models/categories.dart';
import 'package:app/data/models/dish.dart';
import 'package:app/home/detail_dish.screen.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

class listDishScreen extends StatefulWidget {
  @override
  _listDishScreenState createState() => _listDishScreenState();
}

// list all dish by kategori
class _listDishScreenState extends State<listDishScreen> {
  @override
  Widget build(BuildContext context) {
    return MVVM<listDishViewModel>.builder(
      viewModel: listDishViewModel(),
      viewBuilder: ((context, vm) => Scaffold(
            appBar: AppBar(
              title: Text('List Dish'),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'List all Dish',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // search bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        icon: Icon(Icons.search),
                      ),
                      onChanged: (value) => vm.searchDish(value),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: vm.listDish.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black,
                      ),
                      itemBuilder: ((context, index) {
                        return ListTile(
                          onTap: () => vm.goToDetailDish(vm.listDish[index]),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(vm.listDish[index].image ?? ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(vm.listDish[index].name),
                          subtitle: Text(vm.listDish[index].description ?? ''),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(rupiahFormat(vm.listDish[index].price ?? 0)),
                              const SizedBox(width: 10),
                              // add to favorite
                              IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: vm.listDish[index].isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () => vm.likeDish(vm.listDish[index]),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class listDishViewModel extends ViewModel with BaseViewModel {
  List<DishModel> listDish = [];
  List<DishModel> listDishAll = [];

  @override
  void init() async {
    super.init();

    // get list dish by kategori
    listDish = dishData;
    listDishAll = dishData;

    notifyListeners();
  }

  searchDish(String value) {
    if (value.isEmpty || value == '') {
      listDish = listDishAll;
    } else {
      listDish = listDishAll.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    }
    notifyListeners();
  }

  goToDetailDish(DishModel listDish) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailDishScreen(dish: listDish),
      ),
    );
  }
  
  likeDish(DishModel listDish) {
    listDish.isFavorite = !listDish.isFavorite;

    notifyListeners();
  }
}
