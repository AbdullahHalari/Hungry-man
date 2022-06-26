import 'package:flutter/material.dart';
import 'package:bottom_bars/bottom_bars.dart';
import 'package:hungryman/home.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:hungryman/profile.dart';
import 'package:hungryman/cart.dart';


class Bottombar extends StatefulWidget {
  
  // const Bottombar({ Key? key }) : super(key: key);


  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  
  @override
  Widget build(BuildContext context) {
    
     return WillPopScope(
        onWillPop: () async {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Please First login to enter the app')));
          return false;
        },
        child: BottomBars(
      
      items: [
        BottomBarsItem(
          
          page: 
          Scaffold(
           
            body: 
          
            Home(),
   
          ),

          item: Item(
            activeColor: Colors.black,
           color: Colors.amber,
            icon: Icons.home,
            title: Text("Home"),
            
          ),
          
        ),
        BottomBarsItem(
          page: Scaffold(
           body: Cart(),
          ),
          

          item: Item(
            activeColor: Colors.black,
            color: Colors.amber,
            icon: Icons.shopping_cart,
            title: Text("Cart",),
          ),
        ),
        BottomBarsItem(
          page: Scaffold(
             body: Profile(),
          ),
          item: Item(
            activeColor: Colors.black,
            color: Colors.amber,
            icon: Icons.account_circle,
            title: Text("Profile"),
          ),
        ),
        // BottomBarsItem(
        //   page: Scaffold(
            
        //   ),
        //   item: Item(
        //     icon: Icons.settings,
        //     title: Text("Settings"),
        //     color: Colors.grey,
        //   ),
          
        // ),
        
      ],),
    );
    
  
    
  }
}
