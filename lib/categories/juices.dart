import 'package:flutter/material.dart';
import 'package:hungryman/home.dart';
// import 'package:hungryman/home.dart';
import 'package:hungryman/modles/food_categories_modle.dart';
import 'package:hungryman/provider/my_provider.dart';
import 'package:hungryman/screen/categories.dart';
import 'package:provider/provider.dart';
import 'package:hungryman/bottom_bar.dart';


class Juiceitems extends StatefulWidget {
  // const Juiceitems({ Key? key }) : super(key: key);

  @override
  _JuiceitemsState createState() => _JuiceitemsState();
}

class _JuiceitemsState extends State<Juiceitems> {
  List<FoodCategoriesModle> juiceCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getJuiceCategoriesList();
    juiceCategoriesList = provider.throwJuiceCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("Juice & Shakes"),
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
        body: Categories(list: juiceCategoriesList));
  }
}
