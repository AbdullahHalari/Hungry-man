// ignore_for_file: avoid_print, file_names, prefer_const_constructors, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hungryman/bottom_bar.dart';

class BottomContainer extends StatefulWidget {
  final String image;
  final String name;
  final int price;

  BottomContainer(
      {@required this.image, @required this.price, @required this.name});

  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    Future addToCart() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("users-cart-items");
      return _collectionRef
          .doc(currentUser.email)
          .collection("items")
          .doc()
          .set({
        "name": widget.name,
        "price": widget.price,
        "images": widget.image,
      }).then((value) => Fluttertoast.showToast(msg: "item added"));
    }

    return GestureDetector(
        child: Column(
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
                            widget.image,
                          )),
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
                      child: Text(
                        "${widget.name}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 140,
                      child: Text(
                        " PKR  ${widget.price}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
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
                    Icons.shopping_cart_rounded,
                    size: 30,
                  ),
                  alignment: Alignment(20, 0),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        enableDrag: true,
                        builder: (context) {
                          return Wrap(children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(
                                        30)), // if you need this
                                // side: BorderSide(
                                //   color: Colors.orange,
                                //   width: 2,
                                // ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                      height: 170,
                                      width: 400,
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              topLeft: Radius.circular(30)),
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                widget.image,
                                              )),
                                        ),
                                      )),
                                  // counter(),
                                  Container(
                                    child: Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: Text(
                                      "shfdysi[preelvkgdyteqtweoqwriposfcvcgr78[yofldnvsfdytwreow;fjsdkjtr8ry[ptkglvjfgorey;g",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 10, 10, 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          // IconData(60383,
                                          //     fontFamily: 'MaterialIcons'),
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          "PKR  ${widget.price}",
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.delivery_dining,
                                          color: Colors.amber,
                                        ),
                                        Text(" pkr 50"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.timer,
                                          color: Colors.amber,
                                        ),
                                        Text(" 45 mins"),
                                      ],
                                    ),
                                  )),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(30.0),
                                          ),
                                          primary: Colors.amber,
                                          padding: EdgeInsets.fromLTRB(
                                              100, 10, 100, 10)),
                                      onPressed: () {
                                        addToCart();
                                        Navigator.pop(context);
                                      },
                                      child: Text("ADD TO BASKET"))
                                ],
                              ),
                            )
                          ]);
                        });

                    print("add to cart");
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
    
    ));
    
  }
}

// class counter extends StatefulWidget {

//   const counter({ Key key }) : super(key: key);

//   @override
//   _counterState createState() => _counterState();
// }

// class _counterState extends State<counter> {
//   int _n = 0;
  

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Container(
//         width: 200,
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               FloatingActionButton(
//                 onPressed: (){
//                   setState(() {
//                 _n++;
//               });
//                 },
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.black,
//                 ),
//                 backgroundColor: Colors.amber,
//               ),
//               Text('$_n', style: TextStyle(fontSize: 40.0)),
//               FloatingActionButton(
//                 onPressed: (){
//                   if (_n != 0)
//                     setState(() {
//                       _n--;
//                     });
//                 },
//                 child: new Icon(Icons.remove, color: Colors.black),
//                 backgroundColor: Colors.amber,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
