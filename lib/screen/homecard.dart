// import 'package:hungryman/modles/food_categories_modle.dart';
// import 'package:hungryman/card.dart';
// import 'package:flutter/material.dart';
// // import 'package:hungryman/home.dart';

// // ignore: must_be_immutable
// class Homecard extends StatelessWidget {

//   List<ItemModle> list = []; 
//   Homecard({@required this.list});
  
//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       // appBar: PreferredSize( 
//       //   preferredSize: Size.fromHeight(40),
//       //   child:AppBar(
            
//       //    backgroundColor: Colors.black,
//       //   // elevation: 0.0,
//       //   leading: IconButton(
//       //     icon: Icon(Icons.arrow_back),
//       //     onPressed: () {
//       //       Navigator.of(context).pushReplacement(
//       //           MaterialPageRoute(builder: (contet) => Home()));
//       //     },
//       //   ),),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//         child: GridView.count(
//             shrinkWrap: false,
//           primary: false,
//             crossAxisCount: 1,
//           //   childAspectRatio: 4.0,
            
//             children: list
//                 .map(
//                   (e) => Carditem(               
//                     image: e.image,
//                     price: e.price,
//                     name: e.name,
//                     des: e.des,
//                   ),
//                 )
//                 .toList()),
//       ),
     
//     );
//   }
// }
