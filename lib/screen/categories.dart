import 'package:hungryman/modles/food_categories_modle.dart';
import 'package:hungryman/screen/widget/bottom_Contianer.dart';
import 'package:flutter/material.dart';
// import 'package:shopping_shop/home.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {

  List<FoodCategoriesModle> list = []; 
  Categories({@required this.list});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: PreferredSize( 
      //   preferredSize: Size.fromHeight(40),
      //   child:AppBar(
            
      //    backgroundColor: Colors.black,
      //   // elevation: 0.0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (contet) => Home()));
      //     },
      //   ),),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: GridView.count(
            shrinkWrap: false,
          primary: false,
            crossAxisCount: 1,
            childAspectRatio: 4.0,
            
            children: list
                .map(
                  (e) => BottomContainer(               
                    image: e.image,
                    price: e.price,
                    name: e.name,
                  ),
                )
                .toList()),
      ),
     
    );
  }
}
