import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hungryman/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class Home1 extends StatefulWidget {
  // const Home1({ Key? key }) : super(key: key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  Stream postStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  TextEditingController titlecontroller = TextEditingController();
  String imagePath;

  @override
  Widget build(BuildContext context) {
    void pickImage() async {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        imagePath = image.path;
      });
      print(image.path);
    }

    void submit() async {
      try {
        String title = titlecontroller.text;
        // firebase_storage.FirebaseStorage storage =
        //     firebase_storage.FirebaseStorage.instance;
        String imageName = path.basename(imagePath);
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('/$imageName');

        File file = File(imagePath);
        await ref.putFile(file);
        String downloadUrl = await ref.getDownloadURL();
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db.collection("posts").add({
          "title": title,
          "url": downloadUrl,
        });
        print("upload successfully");
        titlecontroller.clear();
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              TextFormField(
                controller: titlecontroller,
                decoration: InputDecoration(
                  labelText: 'enter title',
                ),
              ),
              ElevatedButton(onPressed: pickImage, child: Text("choose image")),
              ElevatedButton(onPressed: submit, child: Text("POST")),
              Expanded(
                  child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: postStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        Map data = document.data();
                        String id = document.id;
                        data["id"] = id;
                        return Post(
                          data: data,
                        );
                      }).toList(),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
