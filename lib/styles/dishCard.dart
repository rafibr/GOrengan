// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/data/helper.dart';
import 'package:app/data/models/dish.dart';
import 'package:app/styles/colors.style.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  DishModel dish;
  Function? onTap;
  Function? onLike;

  DishCard({
    Key? key,
    required this.dish,
    required this.onTap,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (() => onTap?.call()),
        child: Card(
          shadowColor: colorStyle.secondary,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(dish.image ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // heart icon to favorite the dish
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: (() => onLike?.call()),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: dish.isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: colorStyle.primary,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: colorStyle.primary,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      dish.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colorStyle.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      dish.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colorStyle.textLight,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      rupiahFormat(dish.price ?? 0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colorStyle.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
