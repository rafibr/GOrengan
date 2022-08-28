// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      json['id'] as int?,
      json['name'] as String,
      json['description'] as String?,
      json['image'] as String?,
      json['price'] as int?,
      json['categoryId'] as int?,
      json['isFavorite'] as bool,
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'isFavorite': instance.isFavorite,
    };
