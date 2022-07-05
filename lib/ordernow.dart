import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class order_now extends StatefulWidget {
  const order_now({Key key}) : super(key: key);

  @override
  State<order_now> createState() => _order_nowState();
}

class _order_nowState extends State<order_now> {
  String full_name = " loading....";
  String email = "loading....";
  String collectionName = "users-cart-items";
  double total = 0;
  double dc = 70;
  
  void getData() async {
    // ignore: await_only_futures
    User user = await FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    setState(() {
      full_name = data.data()['first_name'] + data.data()['last_name'];
      email = data.data()['email'];
    });
  }

  void initState() {
    super.initState();
    getData();
  }

  // void total() async {
  //   var data = await FirebaseFirestore.instance
  //       .collection("users-cart-items")
  //       .doc(FirebaseAuth.instance.currentUser.email)
  //       .collection("items")
  //       .snapshots();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: Text(
            "Order Details",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(13),
              child: Column(children: [
                //first name
                Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    minLeadingWidth: 0,
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    leading: Icon(Icons.person),
                    title: Text(
                      "Name:",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    full_name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                // lastname

                //email
                Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    minLeadingWidth: 0,
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    leading: Icon(Icons.email),
                    title: Text(
                      "Email Address:",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    email,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),

                Container(
                  // padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.amber[800]),
                    cursorColor: Colors.red,
                    // controller: fullname,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      // border: OutlineInputBorder(),
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.amber[800])),
                      fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                      filled: true,
                      // fillColor: Colors.black,
                      hoverColor: Colors.amber[800],
                      labelStyle: TextStyle(color: Colors.black),

                      labelText: 'Mobile no: ',
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                ),
                Container(
                  // padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.amber[800]),
                    cursorColor: Colors.red,
                    // controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      // border: OutlineInputBorder(),
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.amber[800])),
                      fillColor: Color.fromRGBO(255, 255, 255, 0.2),
                      filled: true,
                      // fillColor: Colors.black,
                      hoverColor: Colors.amber[800],
                      labelStyle: TextStyle(color: Colors.black),

                      labelText: 'Address:',
                    ),
                  ),
                ),

                Container(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(FirebaseAuth.instance.currentUser.email)
                        .collection("items")
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError)
                        return Text('Something went wrong');
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Text("wait..");

                      // NB: I set the value of total = 0; so that anytime the stream
                      // builder is called, total starts from 0.
                      total = 0;
                      snapshot.data.docs.forEach((result) {
                        total += result.data()['price'];
                      });
                      print(total);
                      print('done');
                      return
                          // Container(
                          //   child:text
                          // )
                          ListTile(
                        title: Text("Total Amount:"),
                        trailing: Text(
                          "PKR $total",
                          style:
                              TextStyle(color: Colors.green[900], fontSize: 30),
                        ),
                      );
                    },
                  ),
                ),

                ListTile(
                  title: Text("Delivery Charges:"),
                  trailing: Text(
                    "PKR $dc",
                    style: TextStyle(color: Colors.green[900], fontSize: 30),
                  ),
                ),
                ListTile(
                  
                  title: Text("Total Amount:"),
                  trailing: Text(
                    "PKR $total +$dc",
                    style: TextStyle(color: Colors.green[900], fontSize: 30),
                  ),
                ),
              ])),
        ));
  }
}
