import 'package:app1/home.dart';
import 'package:app1/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_player/video_player.dart';
import 'package:app1/route.dart';

class realmodel extends StatefulWidget {
  realmodel({Key? key}) : super(key: key);

  @override
  _realmodelState createState() => _realmodelState();
}

class _realmodelState extends State<realmodel> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/real.mp4?alt=media&token=a3fbde80-8f3d-4ab9-8dcb-00e948495f5b')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   // title: Text('Faded jeans'),
        //   backgroundColor: Color.fromARGB(255, 27, 27, 27),
        // ),
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
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
              height: 30,
            ),
            move(),
            // SizedBox(
            //       width: 200,
            //       height: 30,
            //     ),
            //     Center(
            //         child: Padding(
            //       padding: const EdgeInsets.all(15.0),
            //       child: Text('Faded denim shorts Matte with a white shirt. Wear it and look comfortable every day that you have worn it.'
            //         ,
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w500,
            //           color: Color.fromARGB(159, 0, 0, 0),
            //         ),
            //       ),
            //     )),
            //     SizedBox(
            //       width: 200,
            //       height: 10,
            //     ),
            // showButton(),
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
          backgroundColor: Color.fromARGB(255, 218, 64, 64),
        ),
      ],
    );
  }

//   Widget skin() {
//     return SizedBox(
//       width: 195.0,
//       height: 55.0,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color.fromARGB(255, 247, 172, 106),
//         ),
//         child: Text(
//           'Skin tones',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                     backgroundColor: Color.fromARGB(251, 203, 202, 201),
//                     title: Text(
//                       'Skin Tones',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromARGB(222, 1, 2, 4),
//                       ),
//                     ),
//                     content: Image.network('https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/skin_mix2.png?alt=media&token=eb09db9c-4ad7-44bc-89bb-3b2e24ca432e'),
//                     actions: [
//                       SizedBox(
//                         width: 300,
//                         height: 40,
//                         child: Center(
//                           child: SizedBox(
//                             width: 300,
//                             height: 60,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor:
//                                       Color.fromARGB(255, 223, 98, 8)),
//                               child: Text(
//                                 'OK',
//                                 style: TextStyle(
//                                   fontSize: 23,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color.fromARGB(222, 46, 46, 46),
//                                 ),
//                               ),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                     ],
//                   ));
//         },
//       ),
//     );
//   }

//   Widget buy() {
//     return SizedBox(
//       width: 195.0,
//       height: 55.0,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color.fromARGB(255, 238, 84, 143),
//         ),
//         child: Text(
//           'Get',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () {
//           Navigator.pushNamed(context, '');
//         },
//       ),
//     );
//   }

//   Widget showButton() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         skin(),
//         SizedBox(
//           width: 2.0,
//           height: 30.0,
//         ),
//         buy()
//       ],
//     );
//   }
}