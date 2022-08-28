import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class CategoriesModel {
  int? id;
  String name;
  String? description;
  String? image;

  CategoriesModel(this.id, this.name, this.description, this.image);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

  @override
  String toString() {
    return 'CategoriesModel{id: $id, name: $name, description: $description}';
  }
}

List<CategoriesModel> categoriesData = [
  CategoriesModel(
    1,
    'Makanan',
    'Makanan yang bisa dimakan',
    'https://picsum.photos/200',
  ),
  CategoriesModel(
    2,
    'Minuman',
    'Minuman yang bisa diminum',
    'https://picsum.photos/200',
  ),
  CategoriesModel(
    3,
    'Cemilan',
    'Cemilan yang bisa dicemil',
    'https://picsum.photos/200',
  ),
];
