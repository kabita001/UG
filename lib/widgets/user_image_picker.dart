// ignore_for_file: deprecated_member_use, prefer_const_constructors


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);
  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),//or 15.0
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent)
            ),
            height: 100.0,
            width: 150.0,
            child: _pickedImage != null?Image.file(_pickedImage): null,
          ),
        ),
        FlatButton.icon(
          color: Colors.redAccent,
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Add Image'),),
      ],
    );
  }
}



