

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
        // ClipRRect(
        // height: 70.0,
        // width: 70.0,
        // color: Color(0xffFF0E58),
        //   borderRadius: BorderRadius.all(Radius.circular(10.0)),//add border radius here
        //   child: _pickedImage != null?Image.file(_pickedImage): null,//add image location here
        // ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),//or 15.0
          child: Container(
            height: 70.0,
            width: 60.0,
            color: Color(0xffFF0E58),
            child: _pickedImage != null?Image.file(_pickedImage): null,
          ),
        ),
        // CircleAvatar(
        //   backgroundImage: _pickedImage != null? FileImage(_pickedImage): null,
        //   radius: 40,
        //   backgroundColor: Colors.grey,
        // ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Add Image'),),
      ],
    );
  }
}



