import 'package:app/base_view_model.dart';
import 'package:app/data/helper.dart';
import 'package:app/data/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

class DetailDishScreen extends StatefulWidget {
  final DishModel dish;

  const DetailDishScreen({Key? key, required this.dish}) : super(key: key);

  @override
  _DetailDishScreenState createState() => _DetailDishScreenState();
}

class _DetailDishScreenState extends State<DetailDishScreen> {
  @override
  Widget build(BuildContext context) {
    return MVVM<DetailDishViewModel>.builder(
      viewModel: DetailDishViewModel(widget.dish),
      viewBuilder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.dish.name.toString(), style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(vm.dish!.image.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        //  favorite button
                        child: IconButton(
                          icon: vm.dish!.isFavorite == false ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            vm.setFavorite();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  vm.dish!.name.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  vm.dish!.description.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                // price
                SizedBox(
                  height: 10,
                ),
                Text(
                  rupiahFormat(vm.dish!.price ?? 0),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

class DetailDishViewModel extends ViewModel with BaseViewModel {
  DishModel? dish;

  DetailDishViewModel(this.dish);

  @override
  void init() {
    super.init();
  }

  void setFavorite() {
    dish?.isFavorite = !dish!.isFavorite;
    notifyListeners();
  }
}
