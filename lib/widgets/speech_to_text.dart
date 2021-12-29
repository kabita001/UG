// ignore_for_file: avoid_print, prefer_const_constructors, deprecated_member_use, annotate_overrides, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText extends StatefulWidget {
  SpeechToText(this.speechToTextFn);

  final void Function(String textString) speechToTextFn;

  @override
  _SpeechToTextState createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _textSpeech = '';

  void onListen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (val) => setState(() {
            _textSpeech = val.recognizedWords;
          }));
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
    widget.speechToTextFn(_textSpeech);
  }

  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
          child:ListTile(
            title: Text(_textSpeech),
            //trailing widget used to display after the title
            trailing: AvatarGlow(
              animate: _isListening,
              glowColor: Theme.of(context).primaryColor,
              endRadius: 80,
              duration: Duration(milliseconds: 2000),
              repeatPauseDuration: Duration(milliseconds: 100),
              repeat: true,
              child: FlatButton(
                onPressed: onListen,
                child: Icon(_isListening ? Icons.mic : Icons.mic_none),
              ),
            ),
          ),
      ),
    );
  }
}
