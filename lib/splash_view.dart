import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hungryman/services/shared_preferences_service.dart';
import 'package:hungryman/routes.dart';
// import 'package:hungryman/main.dart';


class SplashView extends StatefulWidget {
  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  final PrefService _prefService = PrefService();

  @override
  void initState() {
    _prefService.readCache("password").then((value) {
      print(value.toString());
      if (value != null) {
        return Timer(Duration(seconds: 1),
            () => Navigator.of(context).pushNamed(HomeRoute));
      } else {
        return Timer(Duration(seconds: 1),
            () => Navigator.of(context).pushNamed(FormRoute));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image.asset("images/logohm.png")),
    );
  }
}
