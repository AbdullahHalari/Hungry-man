import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Timer extends StatefulWidget {
  const Timer({Key key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
//       body: Center(
//   child: Container(
//     // height: 500,
//     // width: 500,
//     // color: Colors.blue[50],
//     child: Column(
//       children: [
//         Align(
//           alignment:Alignment.center,
//         child:Text("hduihfjkhjk"),),
//         Text("data")
//       ],
//     )
//   ),
// )
body:
Padding(padding: EdgeInsets.all(130),
child:
Column(

  children: [
    Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image.asset(
                'images/logohm.png',
                width: 100,
                height: 150,
              ),
            ),
     Text("data"),
     ElevatedButton(onPressed: (){}, child: Text("data"))  
  ],
)
    ));
  }
}