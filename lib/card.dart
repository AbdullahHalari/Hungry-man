import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Carditem extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String des;
  Carditem(
      {@required this.image,
      @required this.price,
      @required this.name,
      @required this.des});

  // const Carditem({ Key key }) : super(key: key);

  @override
  _CarditemState createState() => _CarditemState();
}

class _CarditemState extends State<Carditem> {
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

    return Container(
      height: 310,
      width: 400,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // if you need this
          side: BorderSide(
            color: Colors.orange,
            width: 3,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.image,
                      ))),
              height: 210,
              width: 400,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.amber,
                          borderRadius: new BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart_sharp,
                            size: 35,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // bottomsheet();
                            addToCart();
                          },
                        ),
                      )),
                ),
              ),
            ),
            Container(
                child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "${widget.name}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.des}",
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 5, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_money_outlined,
                            color: Colors.amber,
                          ),
                          Text("   PKR ${widget.price}    |     "),
                          Icon(
                            Icons.timer,
                            color: Colors.amber,
                          ),
                          Text("  45 mins     |     "),
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.amber,
                          ),
                          Text("  50rs  "),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
    //  Column(
    //   children: [
    //     Container(
    //       color: Colors.grey[100],
    //       child: Row(
    //         children: [
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Container(
    //               height: 70,
    //               width: 70,
    //               child: Container(
    //                 decoration: new BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                   image: new DecorationImage(
    //                       fit: BoxFit.fill,
    //                       image: NetworkImage(
    //                         widget.image,
    //                       )),
    //                 ),
    //               )),
    //           SizedBox(
    //             width: 40,
    //           ),
    //           Container(
    //             child: Column(
    //               children: [
    //                 Container(
    //                   width: 140,
    //                   child: Text(
    //                     "${widget.name}",
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 Container(
    //                   width: 140,
    //                   child: Text(
    //                     " PR  ${widget.price}",
    //                     style: TextStyle(
    //                       fontSize: 15,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           // SizedBox(
    //           //   width: 60,
    //           // ),
    //           Expanded(
    //             child: Align(
    //                 //  alignment: Alignment.topRight,
    //                 child: IconButton(
    //               icon: Icon(
    //                 Icons.shopping_cart_rounded,
    //                 size: 30,
    //               ),
    //               alignment: Alignment(20, 0),
    //               onPressed: () {

    //                 print("add to cart");
    //               },
    //             )),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Divider(
    //       height: 10,
    //       thickness: 2,
    //     ),
    //   ],
    // );
  }
}
