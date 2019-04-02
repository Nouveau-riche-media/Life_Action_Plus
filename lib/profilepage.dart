import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

//Image Plugin
import 'package:image_picker/image_picker.dart';

//Firebase Storage Plugin
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: sampleImage == null ? Text('Select an image') : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0, width: 300.0),
          RaisedButton(
            elevation: 7.0,
            child: Text('Upload'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              final StorageReference firebaseStorageRef =
                  FirebaseStorage.instance.ref().child('myimage.jpg');
              final StorageUploadTask task =
                  firebaseStorageRef.putFile(sampleImage);
              
            },
          )
        ],
      ),
    );
  }
}
