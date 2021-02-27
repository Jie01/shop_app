import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/save.dart';

class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

File image;

class _PhotoState extends State<Photo> {
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        saveImage(image.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 115,
          width: 115,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: image == null
                ? Icon(
                    Icons.person,
                    size: 115,
                    color: Color(0xaa000060),
                  )
                : Image.file(
                    image,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          bottom: -17,
          right: -15,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.white),
            ),
            backgroundColor: Colors.grey[100],
            onPressed: getImage,
            child: Icon(
              Icons.add_a_photo,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
