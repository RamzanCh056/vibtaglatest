import 'package:flutter/material.dart';
class MyPlaylist extends StatefulWidget {
  const MyPlaylist({Key? key}) : super(key: key);

  @override
  State<MyPlaylist> createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                 Image.asset("assets/images/findvibe/empty.png"),

              const Text('There is no playlist yet!', style: TextStyle(fontSize: 20, color: Color(0xff000000))),
              const Text('Create your new playlist buy clicking the button below & add whatever you want!', style: TextStyle(fontSize: 15, color: Color(0xff7D8CAC),




              ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15,),
              Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.menu, size: 28,
                        color: Color(0xff99A7C7),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Create new playlist', style: TextStyle(fontSize: 16, color: Color(0xff99A7C7)))
                    ],
                  ),
                ),
              ),

          ],),
        ),
      ),

    );
  }
}
