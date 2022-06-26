import 'package:flutter/material.dart';
import 'package:hungryman/home.dart';
import 'package:hungryman/bottom_bar.dart';
import 'package:hungryman/modles/food_categories_modle.dart';
import 'package:hungryman/provider/my_provider.dart';
import 'package:hungryman/screen/categories.dart';
import 'package:hungryman/screen/homecard.dart';
import 'package:provider/provider.dart';
class Carditems extends StatefulWidget {
  // const Carditems({ Key? key }) : super(key: key);

  @override
  _CarditemsState createState() => _CarditemsState();
}

class _CarditemsState extends State<Carditems> {
  // List<FoodCategoriesModle> burgerCategoriesList = [];
  List<ItemModle> homeList = [];
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getHomeList();
    homeList = provider.throwHomeList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Card"),
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
        // body:
        // Homecard(list: homeList)
        );
  }
}
