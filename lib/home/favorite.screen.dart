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

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

// list all dish by kategori
class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return MVVM<favoriteViewModel>.builder(
      viewModel: favoriteViewModel(),
      viewBuilder: ((context, vm) => Scaffold(
            appBar: AppBar(
              title: Text('Favorite Dish', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
            ),
            body: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Favorite (${vm.listDishAll.length} items)',
                    style: const TextStyle(
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
                  vm.listDishAll.isEmpty
                      ? const Center(
                          child: Text('No Data'),
                        )
                      : Expanded(
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
                                        color: vm.listDish[index].isFavorite ? Colors.red : Colors.grey,
                                      ),
                                      onPressed: () => vm.setFavorite(vm.listDish[index]),
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

class favoriteViewModel extends ViewModel with BaseViewModel {
  List<DishModel> listDish = [];
  List<DishModel> listDishAll = [];

  @override
  void init() async {
    super.init();

    // get list dish by kategori
    await getDishByKategori();

    notifyListeners();
  }

  Future getDishByKategori() async {
    // get list dish by kategori
    listDishAll = dishData.where((element) => element.isFavorite == true).toList();
    listDish = listDishAll;
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

  setFavorite(DishModel listDish) {
    listDish.isFavorite = !listDish.isFavorite;
    init();
    notifyListeners();
  }
}
