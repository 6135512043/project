import 'package:app1/home.dart';
import 'package:app1/models/item_model.dart';
import 'package:app1/shopping.dart';
import 'package:app1/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_player/video_player.dart';
import 'package:app1/route.dart';
import 'package:url_launcher/url_launcher.dart';

class Showmodel extends StatefulWidget {
  final ItemModel itemModel;
  Showmodel({Key? key, required this.itemModel}) : super(key: key);
  @override
  _ShowmodelState createState() => _ShowmodelState();
}

class _ShowmodelState extends State<Showmodel> {
  late VideoPlayerController _controller;

  Future<void> _launcherURL(String url) async {
    final Uri uri = Uri.parse(model!.urlitem);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      )){
        throw "Can not launch url";
      }
  }

  ItemModel? model;
  @override
  void initState() {
    super.initState();
    model = widget.itemModel;
    _controller = VideoPlayerController.network(model!.model)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 160, 58, 190),
          title: Text(model!.name == null ? 'show model' : model!.name),
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
              child: Text(
                model!.comment,
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

            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: <Widget>[
            //         ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //   backgroundColor: Color.fromARGB(255, 238, 84, 143),
            // ),
            // onTap = launchUrl(model.urlitem),
            // onPressed: () {  },
            // child: Text(
            //   'Get',
            //   style: TextStyle(color: Colors.white, fontSize: 20),
            // ),
            //         ),
            //       ],
            //     ),

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
                    content: Image.network(model!.skin),
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
        onPressed: (){
            _launcherURL(model!.urlitem);
        },
        child: Text(
          'Get',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
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
