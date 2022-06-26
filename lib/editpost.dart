import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class EditPost extends StatefulWidget {
  final Map data;
  EditPost({this.data});

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  String imagePath;
  TextEditingController titlecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    titlecontroller.text = widget.data["title"];
  }

  Widget build(BuildContext context) {
    void pickImage() async {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.getImage(source: ImageSource.gallery);

      setState(() {
        imagePath = image.path;
      });
      print(image.path);
    }

    void done() async {
      try {
        String imageName = path.basename(imagePath);

        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('/$imageName');

        File file = File(imagePath);

        await ref.putFile(file);
        String downloadUrl = await ref.getDownloadURL();
        FirebaseFirestore db = FirebaseFirestore.instance;

        Map<String, dynamic> newPost = {
          "title": titlecontroller.text,
          "url": downloadUrl
        };
        await db.collection("posts").doc(widget.data["id"]).set(newPost);
        Navigator.of(context).pop();
      } catch (e) {
        print(e);
      }
    }

    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titlecontroller,
              decoration: InputDecoration(
                labelText: 'enter title',
              ),
            ),
            ElevatedButton(onPressed: pickImage, child: Text("choose image")),
            ElevatedButton(onPressed: done, child: Text("POST")),
          ],
        ),
      ),
    );
  }
}
