import 'package:flutter/material.dart';
import 'package:hungryman/home.dart';
import 'package:hungryman/bottom_bar.dart';
import 'package:hungryman/modles/food_categories_modle.dart';
import 'package:hungryman/provider/my_provider.dart';
import 'package:hungryman/screen/categories.dart';
import 'package:provider/provider.dart';


class Burgeritems extends StatefulWidget {
  // const Burgeritems({ Key? key }) : super(key: key);

  @override
  _BurgeritemsState createState() => _BurgeritemsState();
}

class _BurgeritemsState extends State<Burgeritems> {
  List<FoodCategoriesModle> burgerCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Burger"),
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
        body: Categories(list: burgerCategoriesList));
  }
}
