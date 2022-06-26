import 'package:flutter/material.dart';
import 'package:hungryman/services/shared_preferences_service.dart';
import 'package:hungryman/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hungryman/Home1post.dart';
// import 'package:hungryman/home.dart';
import 'package:hungryman/bottom_bar.dart';
// import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class Login extends StatefulWidget {
  // const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    void login() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = emailController.text;
      final String password = passwordController.text;
      final PrefService _prefService = PrefService();
      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        final DocumentSnapshot snapshot =
            await db.collection("user").doc(user.user.uid).get();
        snapshot.data();
        _prefService.createCache(passwordController.text).whenComplete(() {
          if (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottombar()));
          }
        });

        print("user is logged in");
        // final UserCredential user = await auth.createUserWithEmailAndPassword(
        //     email: email, password: password);
        // await db.collection("users").doc(user.user.uid).set({
        //   "email": email,
        //   // "first_name": fname,
        //   // "last_name": lname,
        //   "password": password,
        //   // "confirm_password": cpassword,
        // });
        // print("user is registerd");
      } catch (e) {
        print("error");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(e.message),
              );
            });
      }
      
    }

    return WillPopScope(
        onWillPop: () async {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Please First login to enter the app')));
          
          return false;
        },
        child: 
         Scaffold(
            backgroundColor: Colors.black,
            body:Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: ListView(
                  children: [
                    Container(
                      child: Image.asset(
                        'images/logohm.png',
                        width: 100,
                        height: 150,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Welcome back!',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.amber[800]),
                        cursorColor: Colors.red,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber[800])),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                          filled: true,
                          // fillColor: Colors.white,
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.white),

                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.blue),
                        cursorColor: Colors.red,
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber[800])),
                          hoverColor: Colors.amber[800],
                          fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber[800],
                            // padding: EdgeInsets.fromLTRB(100, 0, 100, 0)
                          ),
                          onPressed: login,
                          child: Text("Login")),
                    ),
                    Container(
              height: 15,
              child: Align(
                alignment:  Alignment.centerRight, 
                child: Text("forgot password",
              style: TextStyle(
                    fontSize: 12,
                    color: Colors.amber,
                  ),))
            ),
                    Container(
                        // height: 50,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Column(
                          children: [
                            Text(
                              "Does not have any account?",
                              style: TextStyle(color: Colors.amber[800]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.amber[800],
                                      padding:
                                          EdgeInsets.fromLTRB(100, 0, 100, 0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()));
                                  },
                                  child: Text("Sign up")),
                            ),
                          ],
                        ))
                  ],
                ),
              ),)
            ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
