// import 'package:sharedpreftutorial/views/home_view.dart';
// import 'package:sharedpreftutorial/views/login_view.dart';
// import 'package:sharedpreftutorial/views/splash_view.dart';
import 'package:hungryman/bottom_bar.dart';
import 'package:hungryman/login.dart';
// import 'package:hungryman/home.dart';
import 'package:hungryman/splash_view.dart';
import 'package:hungryman/main.dart';

const String SplashRoute = "/splash";
const String HomeRoute = "/home";
const String LoginRoute = "/login";
const String FormRoute = "/Form";

final routes = {
  SplashRoute: (context) => SplashView(),
  LoginRoute: (context) => Login(),
  HomeRoute: (context) => Bottombar(),
  FormRoute: (context) => Form()
};
