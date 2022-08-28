import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable()
class DishModel {
  int? id;
  String name;
  String? description;
  String? image;
  int? price;
  int? categoryId;
  bool isFavorite;

  DishModel(this.id, this.name, this.description, this.image, this.price, this.categoryId, this.isFavorite);

  factory DishModel.fromJson(Map<String, dynamic> json) => _$DishModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishModelToJson(this);

  @override
  String toString() {
    return 'DishModel{id: $id, name: $name, description: $description, image: $image, price: $price, categoryId: $categoryId}';
  }
}

// category 1 (makanan):
// - Nasi Goreng
// - Mie Goreng
// - Bakso
// - Soto
// - Sate
// - Nasi Uduk

// category 2 (minuman):
// - Es Teh
// - Es Jeruk
// - Es Campur
// - Es Kelapa Muda
// - Es Kelapa
// - Es Cendol

// category 3 (cemilan):
// - Kripik
// - Kue
// - Donat
// - Pisang Goreng
// - Tahu Isi
// - Tempe Goreng
// - Gumpal
// - Kacang

List<DishModel> dishData = [
  DishModel(
    1,
    'Nasi Goreng',
    'Nasi Goreng yang enak',
    'https://picsum.photos/200/300',
    10000,
    1,
    true,
  ),
  DishModel(
    2,
    'Mie Goreng',
    'Mie Goreng yang enak',
    'https://picsum.photos/200/300',
    10000,
    1,
    false,
  ),
  DishModel(
    3,
    'Bakso',
    'Bakso yang enak',
    'https://picsum.photos/200/300',
    10000,
    1,
    true,
  ),
  DishModel(
    4,
    'Soto',
    'Soto yang enak',
    'https://picsum.photos/200/300',
    10000,
    1,
    false,
  ),
  DishModel(
    5,
    'Sate',
    'Sate yang enak',
    'https://picsum.photos/200/300',
    10000,
    1,
    false,
  ),
  DishModel(
    6,
    'Nasi Uduk',
    'Nasi Uduk yang enak',
    'https://picsum.photos/200/300',
    10000,
    1,
    true,
  ),
  DishModel(
    7,
    'Es Teh',
    'Es Teh yang enak',
    'https://picsum.photos/200/300',
    10000,
    2,
    false,
  ),
  DishModel(
    8,
    'Es Jeruk',
    'Es Jeruk yang enak',
    'https://picsum.photos/200/300',
    10000,
    2,
    false,
  ),
  DishModel(
    9,
    'Es Campur',
    'Es Campur yang enak',
    'https://picsum.photos/200/300',
    10000,
    2,
    true,
  ),
  DishModel(
    10,
    'Es Kelapa Muda',
    'Es Kelapa Muda yang enak',
    'https://picsum.photos/200/300',
    10000,
    2,
    true,
  ),
  DishModel(
    11,
    'Es Kelapa',
    'Es Kelapa yang enak',
    'https://picsum.photos/200/300',
    10000,
    2,
    true,
  ),
  DishModel(
    12,
    'Es Cendol',
    'Es Cendol yang enak',
    'https://picsum.photos/200/300',
    10000,
    2,
    false,
  ),
  DishModel(
    13,
    'Kripik',
    'Kripik yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
  DishModel(
    14,
    'Kue',
    'Kue yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
  DishModel(
    15,
    'Donat',
    'Donat yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
  DishModel(
    16,
    'Pisang Goreng',
    'Pisang Goreng yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
  DishModel(
    17,
    'Tahu Isi',
    'Tahu Isi yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
  DishModel(
    18,
    'Tempe Goreng',
    'Tempe Goreng yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
  DishModel(
    19,
    'Gumpal',
    'Gumpal yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
  DishModel(
    20,
    'Kacang',
    'Kacang yang enak',
    'https://picsum.photos/200/300',
    10000,
    3,
    true,
  ),
];
