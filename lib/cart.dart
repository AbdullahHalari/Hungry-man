import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungryman/screen/widget/bottom_Contianer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:demo/fetchproduct.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  String collectionName = "users-cart-items";
  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            title: Center(child: Text("YOUR CART")),
            automaticallyImplyLeading: false,

            backgroundColor: Colors.black,
            // leading: IconButton(
            //   onPressed: () {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //         builder: (ctx) => Home(),
            //       ),
            //     );
            //   },
            //   icon: Icon(Icons.close),
            // ),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(collectionName)
              .doc(FirebaseAuth.instance.currentUser.email)
              .collection("items")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something is wrong"),
              );
            }

            return ListView.builder(
                itemCount:
                    snapshot.data == null ? 0 : snapshot.data.docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot _documentSnapshot =
                      snapshot.data.docs[index];
                  void deleteitem() {
                    FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(FirebaseAuth.instance.currentUser.email)
                        .collection("items")
                        .doc(_documentSnapshot.id)
                        .delete();
                  }

                  return Column(
                    children: [
                      Container(
                        color: Colors.grey[100],
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: 70,
                                width: 70,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            _documentSnapshot['images'])),
                                  ),
                                )),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 140,
                                    child: Text(_documentSnapshot['name']),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 140,
                                    child: Text(
                                      "\$ ${_documentSnapshot['price']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  // Container(
                                  //   child:counter().
                                  // )
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: 60,
                            // ),
                            Expanded(
                              child: Align(
                                  //  alignment: Alignment.topRight,
                                  child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 30,
                                ),
                                alignment: Alignment(20, 0),
                                onPressed: () {
                                  deleteitem();

                                  Fluttertoast.showToast(msg: "item removed");
                                },
                              )),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                      ),
                    ],
                  );
                });
          },
        ),
        bottomNavigationBar: Container(
          
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(collectionName)
                .doc(FirebaseAuth.instance.currentUser.email)
                .collection("items")
                .snapshots(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) return Text('Something went wrong');
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
              return ListTile(
                title: Text("Total Amount"),
                subtitle: Text(
                  "$total",
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
                trailing: Container(
                  width: 160,
                  child: ElevatedButton(
                    child: Text("CHECK OUT"),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(30.0),
                          ),
                          primary: Colors.amber,
                          // padding: EdgeInsets.fromLTRB(
                          //     100, 10, 100, 10)
                          ),
                      onPressed: () {
                      },
                      )
                ),
              );
            },
          ),
        )
     
        );
  }
}
