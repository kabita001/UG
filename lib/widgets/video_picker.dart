// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoUpload extends StatefulWidget {
  VideoUpload(this.videoPickFn);
  final void Function(File pickedVideo) videoPickFn;

  @override
  _VideoUploadState createState() => _VideoUploadState();
}

class _VideoUploadState extends State<VideoUpload> {

  VideoPlayerController _videoPlayerController;
  File _pickedVideo;
  final picker = ImagePicker();

  //image picker
  /*void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }*/
  

  _pickVideo() async {
    final pickedVideoFile =  await picker.getVideo(source: ImageSource.gallery);

    _pickedVideo = File(_pickedVideo.path);
    _videoPlayerController = VideoPlayerController.file(_pickedVideo)..initialize().then((_) => {
      setState((){
      }),
      _videoPlayerController.play(),
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if(_pickedVideo != null)
            _videoPlayerController.value.isInitialized ? AspectRatio(
              aspectRatio:  _videoPlayerController.value.aspectRatio, 
              child: VideoPlayer(_videoPlayerController),
              
            ) : Container()
          else
            Text('Click on pick video'),
          RaisedButton(
            onPressed: (){
              _pickVideo();
            },
            child: Text('Pick video from gallery'),
          )
        ],
      ),
      
    );
  }
}
