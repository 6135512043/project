import 'package:app1/home.dart';
import 'package:app1/item2.dart';
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
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
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
            child: Expanded(
          child: SingleChildScrollView(
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
                SizedBox(
                  width: 200,
                  height: 30,
                ),
                Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(159, 0, 0, 0),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 20,
                ),
                recomment(),
                SizedBox(
          width: 10.0,
          height: 30.0,
        ),
              ],
            ),
          ),
        )),
        // Text(
        //       'Recommended',
        //       style: TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.w500,
        //         color: Color.fromARGB(159, 0, 0, 0),
        //       ),
        //     ),

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

Widget p1() {
  return SizedBox(
    height: 100,
    width: 120,
    child: ElevatedButton(
      child: Column(
        children: [
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/p1.png?alt=media&token=57535297-3788-4008-8f72-ec5ad2371568",
            width: 80,
            height: 80,
          ),
          Text(
            'M short jeans',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => item2(
                ),
              ));
              },
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
}

Widget p2() {
  return SizedBox(
    height: 100,
    width: 120,
    child: ElevatedButton(
      child: Column(
        children: [
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/p2.png?alt=media&token=be998aeb-3f5a-42c6-9f7c-3a486b910b0a",
            width: 80,
            height: 80,
          ),
          Text(
            'Faded jeans',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/item3',);
      },
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
}

Widget p4() {
  return SizedBox(
    height: 100,
    width: 120,
    child: ElevatedButton(
      child: Column(
        children: [
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/p4.png?alt=media&token=f662baf9-e7a9-4658-9b6d-04f6a1764c11",
            width: 80,
            height: 80,
          ),
          Text(
            'Skirt y2k 80s',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/item4',);
      },
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
}

Widget recomment() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[p1(),
    SizedBox(
          width: 10.0,
          height: 50.0,
        ),
     p2(), 
     SizedBox(
          width: 10.0,
          height: 50.0,
        ),
     p4(),
     ],
  );
}

Widget real() {
    return SizedBox(
      width: 110.0,
      height: 55.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 30, 118, 33),
        ),
        onPressed: () {
         Navigator.of(context).pushNamed('/realmodel',);
        },
        child: Text(
          'Real model',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Widget skin() {
    return SizedBox(
      width: 110.0,
      height: 55.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 239, 155, 83),
        ),
        child: Text(
          'Skin tones',
          style: TextStyle(color: Colors.white, fontSize: 16),
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
      width: 160.0,
      height: 55.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 238, 84, 143),
        ),
        onPressed: () {
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
        real(),
        SizedBox(
          width: 2.0,
          height: 30.0,
        ),
        buy()
      ],
    );
  }
}



