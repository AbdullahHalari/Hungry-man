import 'package:bottom_bars/bottom_bars.dart';
import 'package:flutter/material.dart';
import 'package:hungryman/home.dart';
import 'package:hungryman/modles/food_categories_modle.dart';
import 'package:hungryman/provider/my_provider.dart';
import 'package:hungryman/screen/categories.dart';
import 'package:provider/provider.dart';
import 'package:hungryman/bottom_bar.dart';

class Coffeeitems extends StatefulWidget {
  // const Coffeeitems({ Key? key }) : super(key: key);

  @override
  _CoffeeitemsState createState() => _CoffeeitemsState();
}

class _CoffeeitemsState extends State<Coffeeitems> {
  List<FoodCategoriesModle> coffeeCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getCoffeeCategoriesList();
    coffeeCategoriesList = provider.throwCoffeeCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Coffee"),
            backgroundColor: Colors.black,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (contet) => Bottombar()));
              },
            ),
          ),
        ),
        body: Categories(list: coffeeCategoriesList));
  }
}
