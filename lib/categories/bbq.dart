import 'package:flutter/material.dart';
import 'package:hungryman/bottom_bar.dart';
import 'package:hungryman/modles/food_categories_modle.dart';
import 'package:hungryman/provider/my_provider.dart';
import 'package:hungryman/screen/categories.dart';
import 'package:provider/provider.dart';


class Bbqitems extends StatefulWidget {
  // const Bbqitems({ Key? key }) : super(key: key);

  @override
  _BbqitemsState createState() => _BbqitemsState();
}

class _BbqitemsState extends State<Bbqitems> {
  List<FoodCategoriesModle> bbqCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getBbqCategoriesList();
    bbqCategoriesList = provider.throwBbqCategoriesList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text("B.B.Q"),
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
        body: 
        
        Categories(list: bbqCategoriesList),

          
        );
  }
}
