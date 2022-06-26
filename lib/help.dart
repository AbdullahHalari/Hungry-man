import 'package:flutter/material.dart';


class Help extends StatefulWidget {
  // const Help({ Key? key }) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(child: Text("\nGet To Know HUNGRYMAN \n\n Order food and grocery online with the HUNGRYMAN app \n Even when on the move, the free HUNGRYMAN mobile application for iOS, Android and Windows Phone, allows you to order food and groceries online anytime from anywhere. Whichever food you currently desire, we have the largest selection of restaurants for you to choose from, right here on HUNGRYMAN!\nIn three words, the process of ordering food & grocery online is simple, fast, and convenient.\nHow to Order\nTo order food delivery in Pakistan, follow these simple steps:Find a restaurant. Enter your delivery address in the location form to see all the places that deliver to your location. It can be your home, office, a hotel or even parks! Choose your dishes. Browse the menu of the chosen restaurant, select your dishes and add them to your basket. When you are done, press the button.Checkout & Payment. Check your order, payment method selection and exact delivery address. Simply follow the checkout instructions from there.Delivery. We will send you an email and SMS confirming your order and delivery time. Sit back, relax and wait for piping hot food to be conveniently delivered to you!."),),
    ));
  }
}
