import 'package:app1/home.dart';
import 'package:app1/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_player/video_player.dart';
import 'package:app1/route.dart';

class item2 extends StatefulWidget {
const item2({Key? key}) : super(key: key);
  
  @override
  _item2State createState() => _item2State();
}

class _item2State extends State<item2> {
late VideoPlayerController _controller;

@override
void initState(){
super.initState();
_controller = VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/vs2.mp4?alt=media&token=4335d938-79d4-418e-9180-ebf5a93c6a41')
..initialize().then((_) {
  setState(() {});
});
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          title: Text('Model'),
          backgroundColor: Color.fromARGB(255, 160, 58, 190),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child:Column(
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 20,
              ),
          const Text(' '),
          _controller.value.isInitialized
          ?AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
            )
            : Container(),
            SizedBox(
                width: 200,
                height: 0,
              ),
            move(),
            SizedBox(
                width: 200,
                height: 130,
              ),
              showButton(),
            ],
          )
        ),
        
            // floatingActionButton: FloatingActionButton(
            //   hoverColor: Color.fromARGB(255, 230, 83, 240),focusColor: Color.fromARGB(255, 230, 83, 240),
            //   onPressed: () {
            //     setState(() {
            //     _controller.value.isPlaying
            //     ? _controller.pause()
            //     : _controller.play();
            //     });
            //     },
            //     child: Icon(
            //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            //       ),
            //       ),
                  ),
                  );
                  }
                  @override
                  void dispose() {
                  super.dispose();
                  _controller.dispose();
                  }



    Widget move(){
      return Row(mainAxisSize:MainAxisSize.min ,
    children: <Widget>[
      SizedBox(
        width: 325.0,
        height: 10.0,
      ),
        FloatingActionButton(
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
    ),],);
  }

    Widget skin(){
      return SizedBox(
        width: 195.0,
        height: 55.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 247, 172, 106),
          ),
          child: Text('Skin tones',style: TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: (){
            Navigator.pushNamed(
          context,'');
          },
        ),
      );
    }  

    Widget buy(){
      return SizedBox(
        width: 195.0,
        height: 55.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 238, 84, 143),
          ),
          child: Text('Get',style: TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: (){
            Navigator.pushNamed(
          context,'');
          },
        ),
      );
    }  

    Widget showButton(){
  return Row(mainAxisSize:MainAxisSize.min ,
    children: <Widget>[
      skin(),
      SizedBox(
        width: 2.0,
        height: 30.0,
      ),
    buy()],
    );
 }
}