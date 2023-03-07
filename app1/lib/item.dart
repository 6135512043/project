import 'package:app1/home.dart';
import 'package:app1/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const item());
class item extends StatefulWidget {
const item({Key? key}) : super(key: key);
  
  @override
  _itemState createState() => _itemState();
}

class _itemState extends State<item> {
late VideoPlayerController _controller;

@override
void _initState(){
super.initState();
_controller = VideoPlayerController.asset('video/vs1.mp4')
..initialize().then((_) {
  setState(() {});
});
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Item',
        home: Scaffold(
        backgroundColor: Color.fromARGB(255, 160, 58, 190,),
        body: Center(
          child:Column(
            children: <Widget>[
          const Text(' '),
          _controller.value.isInitialized
          ?AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
            )
            : Container(),
            ],
          )
        ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
                });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  ),
                  ),
                  );
                  }
                  @override
                  void dispose() {
                  super.dispose();
                  _controller.dispose();
                  }
}