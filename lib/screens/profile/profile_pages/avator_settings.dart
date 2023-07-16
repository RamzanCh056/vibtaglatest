import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import '../../../utils/constant.dart';
import '../drawer.dart';

class AvatorSettings extends StatefulWidget {
  const AvatorSettings({Key? key}) : super(key: key);

  @override
  State<AvatorSettings> createState() => _AvatorSettingsState();
}

class _AvatorSettingsState extends State<AvatorSettings> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context) + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(title: Text("Avatar", style: TextStyle(color:Colors.white),),),
      body: Scaffold(
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 16),),
                      Text("Recommend ratio is 12.9", style: TextStyle(color: Colors.grey.shade400, fontSize: 12),),

                    ],),
                  Expanded(child: SizedBox(width: 0,)),

                  GestureDetector(
                    onTap: (){
                    //  getFromCamera();
                    },
                    child: Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffC8D1E5).withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(width: 5,),
                          Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 12),),
                        ],),
                    ),
                  ),
                  SizedBox(width: 5,),
                ],),
              SizedBox(height: 10,),
             ClipRRect(
               borderRadius: BorderRadius.circular(20),
                 child: Image.asset("assets/images/Rectangle 23850.png", fit: BoxFit.cover,height: 170,)),
              SizedBox(height: 10,),
              Divider(thickness: 5,color: Colors.grey.shade300, ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Upload Profile", style: TextStyle(color: Colors.black, fontSize: 16),),
                      Text("Recommend ratio is 12.9", style: TextStyle(color: Colors.grey.shade400, fontSize: 12),),

                    ],),
                  Expanded(child: SizedBox(width: 0,)),

                  GestureDetector(
                    onTap: (){
                      //  getFromCamera();
                    },
                    child: Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffC8D1E5).withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(width: 5,),
                          Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 12),),
                        ],),
                    ),
                  ),
                  SizedBox(width: 5,),
                ],),

              SizedBox(height: 30,),


              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage("https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-65746.jpg"),
              )



            ],),
          ),
        ),
      ),

    );

  }

}
