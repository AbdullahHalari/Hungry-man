import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hungryman/editpost.dart';

class Post extends StatelessWidget {
  final data;

  Post({this.data});
  @override
  Widget build(BuildContext context) {
    
    void deletePost() async {
      try {
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db.collection("posts").doc(data["id"]).delete();
      } catch (e) {
        print(e);
      }
    }

    void editPost() async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return EditPost(data: data);
          });
    }

    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            data["url"],
            width: 100,
            height: 100,
          ),
          Title(
            color: Colors.black,
            child: Text(data["title"]),
          ),
          ElevatedButton(onPressed: deletePost, child: Text("delete")),
          ElevatedButton(onPressed: editPost, child: Text("edit"))
        ],
      ),
    );
  }
}
