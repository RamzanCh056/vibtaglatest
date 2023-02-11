import 'package:flutter/material.dart';
class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height:double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/videoman.png"), fit: BoxFit.cover)
          ),
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             Container(height: 110,
             decoration: BoxDecoration(
               borderRadius: const BorderRadius.only(
                 topRight: Radius.circular(15),
                 topLeft: Radius.circular(15),
               ),
                 color: Colors.black.withOpacity(0.5)
             ),
             width: double.infinity,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                 children: const [
                Icon(Icons.camera_alt, color: Colors.white,),
                   Icon(Icons.video_call, color: Colors.white,size: 30,),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child:   Icon(Icons.call_end, color: Colors.white,),
                  ),
                   Icon(Icons.keyboard_voice, color: Colors.white,size: 30),
                   Icon(Icons.lock, color: Colors.white,size: 27),



               ],),


             ),
            ],
          ),
        ),
        Positioned.fill(
          top: 380,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
          height: 140,width: 100,

          decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/recvideo.png"), fit: BoxFit.cover)
          ),

        ),
            )
        )

      ],)
    );
  }
}
