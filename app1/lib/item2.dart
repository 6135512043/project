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
  item2({Key? key}) : super(key: key);

  @override
  _item2State createState() => _item2State();
}

class _item2State extends State<item2> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/vrecommentp1.mp4?alt=media&token=133b6d21-2285-4769-832c-5c1f68944de7')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('M short jeans'),
          backgroundColor: Color.fromARGB(255, 160, 58, 190),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 20,
            ),
            const Text(' '),
            _controller.value.isInitialized
                ? AspectRatio(
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
                  height: 30,
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Short jeans Matte with a white shirt. Wear it and look comfortable every day that you have worn it.'
                    ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(159, 0, 0, 0),
                    ),
                  ),
                )),
                SizedBox(
                  width: 200,
                  height: 10,
                ),
            showButton(),
          ],
        )),

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

  Widget move() {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
          backgroundColor: Color.fromARGB(255, 137, 175, 194),
        ),
      ],
    );
  }

  Widget skin() {
    return SizedBox(
      width: 195.0,
      height: 55.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 247, 172, 106),
        ),
        child: Text(
          'Skin tones',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    backgroundColor: Color.fromARGB(251, 203, 202, 201),
                    title: Text(
                      'Skin Tones',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(222, 1, 2, 4),
                      ),
                    ),
                    content: Image.network('https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/skin_mix1.png?alt=media&token=edc344da-9035-47ff-ba10-a77ec782a4e6'),
                    actions: [
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: Center(
                          child: SizedBox(
                            width: 300,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 223, 98, 8)),
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(222, 46, 46, 46),
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ));
        },
      ),
    );
  }

  Widget buy() {
    return SizedBox(
      width: 195.0,
      height: 55.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 238, 84, 143),
        ),
        child: Text(
          'Get',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '');
        },
      ),
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        skin(),
        SizedBox(
          width: 2.0,
          height: 30.0,
        ),
        buy()
      ],
    );
  }
}
