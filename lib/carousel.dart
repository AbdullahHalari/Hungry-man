import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  // const Carousel({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget> [
        // SizedBox(height: 15.0),
        CarouselSlider(
   
   options: CarouselOptions(
      height: 10.0,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      // initialPage: 0,
      enableInfiniteScroll: true,
      // reverse: false,
      autoPlay: true,
      // autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      // onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
   ),
   items: [
     Container(
       margin: EdgeInsets.all(5.0),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         image: DecorationImage(
           image:  AssetImage("images/bg2.png"),
          //  fit: BoxFit.cover
         )
       )
     )
   ],
 )
      ],
    );
  }
}
