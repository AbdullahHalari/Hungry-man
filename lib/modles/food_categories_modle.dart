import 'package:flutter/cupertino.dart';

class FoodCategoriesModle {
  final String image;
  final String name;
  final int price;
  FoodCategoriesModle(
      {@required this.image, @required this.name, @required this.price});
}

class ItemModle {
  final String image;
  final String name;
  final int price;
  final String des;
  ItemModle({@required this.image, @required this.name, @required this.price,@required this.des});
}
