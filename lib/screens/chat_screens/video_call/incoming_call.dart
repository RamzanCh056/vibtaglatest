import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
class IncomingCall extends StatefulWidget {
  const IncomingCall({Key? key}) : super(key: key);

  @override
  State<IncomingCall> createState() => _IncomingCallState();
}

class _IncomingCallState extends State<IncomingCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       
        children: [
          const SizedBox(height: 80,),
          const Text("Incoming Call...", style: TextStyle(color: Color(0xff7D8CAC), fontSize: 24),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarGlow(
                glowColor: const Color(0xff00FF19),
                endRadius: 90.0,
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: const Duration(milliseconds: 100),
                child: Material(     // Replace this child with your own
                  elevation: 8.0,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 60.0,
                    child: Image.asset(
                      'assets/incalls.png',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            Text("Mark Henry", style: TextStyle( fontSize: 16),),
            SizedBox(width: 5,),
            CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xff54D1B1),

              child: Icon(Icons.done, color: Colors.white,)
            )
          ],),
          const SizedBox(height: 10,),
          const Text("@Mark_ h12", style: TextStyle( fontSize: 12, ),
            textAlign: TextAlign.center

          ),
          const Expanded(child: SizedBox(height: 10,)),
    //  backgroundColor: Color(0xffFF0000).withOpacity(0.2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Container(
             height: 80,
             width: 80,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(100),
               color: const Color(0xffFF0000).withOpacity(0.06),
             ),
             child: const Center(
               child: Icon(Icons.call_end, color: Color(0xffFF0000),size: 30),
             ),

      ),
            const SizedBox(width: 65,),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xff14FF00).withOpacity(0.06),
                ),
                child: const Center(
                  child: Icon(Icons.call, color: Color(0xff14FF00),size: 30,),
                ),

              ),
            )
          ],),
          const SizedBox(height: 60,)



      ],),
    );

  }
}
