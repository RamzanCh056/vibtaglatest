import 'package:flutter/material.dart';

import '../register/reusabletext.dart';

class PlayMovie extends StatefulWidget {
  const PlayMovie({Key? key}) : super(key: key);

  @override
  State<PlayMovie> createState() => _PlayMovieState();
}

class _PlayMovieState extends State<PlayMovie> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff000000),
            elevation: 0,
            leading:IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined,color: Color(0xffFFFFFF),),),
          ),
      backgroundColor: Color(0xff000000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage("Asset/images/Movie/M1.png"),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(title: 'A Man In Sea',size: 14,weight: FontWeight.w500,color: Color(0xffFFFFFF),),
                  SizedBox(height: 10,),
                  ReusableText(title: 'A Man In Sea',size: 12,weight: FontWeight.w400,color: Color(0xffFFFFFF),),
                ],
              ),
              Spacer(
              ),
              Icon(Icons.add_box_outlined,color: Color(0xffFFFFFF),),
              SizedBox(width: 10,),
              Icon(Icons.share,color: Color(0xffFFFFFF),),
              SizedBox(width: 10,),
              Icon(Icons.info_outline,color: Color(0xffFFFFFF),),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Color(0xff3D3D3D),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(title: 'New Episode',size: 14,weight: FontWeight.w600,color: Color(0xffFF9200),),
                      Spacer(),
                      Icon(Icons.more_vert,color: Color(0xffFFFFFF),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Center(child: ReusableText(title: 'Advertisement',size: 14,weight: FontWeight.w600,color: Color(0xffFFFFFF,),)),

                  SizedBox(height: 10,),
                  ListTile(
                    leading: Image(image: AssetImage("Asset/images/Movie/M5.png"),),
                    title:  ReusableText(title: 'Copyright infregment',size: 14,weight: FontWeight.w600,color: Color(0xffFFFFFF,),),
                    subtitle:  ReusableText(title: 'episode 26',size: 14,weight: FontWeight.w500,color: Color(0xffFFFFFF,),),
                    trailing: Icon(Icons.download,color: Color(0xffFFFFFF),),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Image(image: AssetImage("Asset/images/Movie/M2.png"),),
                    title:  ReusableText(title: 'Copyright infregment',size: 14,weight: FontWeight.w600,color: Color(0xffFFFFFF,),),
                    subtitle:  ReusableText(title: 'episode 26',size: 14,weight: FontWeight.w500,color: Color(0xffFFFFFF,),),
                    trailing: Icon(Icons.download,color: Color(0xffFFFFFF),),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Image(image: AssetImage("Asset/images/Movie/M3.png"),),
                    title:  ReusableText(title: 'Copyright infregment',size: 14,weight: FontWeight.w600,color: Color(0xffFFFFFF,),),
                    subtitle:  ReusableText(title: 'episode 26',size: 14,weight: FontWeight.w500,color: Color(0xffFFFFFF,),),
                    trailing: Icon(Icons.download,color: Color(0xffFFFFFF),),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Image(image: AssetImage("Asset/images/Movie/M4.png"),),
                    title:  ReusableText(title: 'Copyright infregment',size: 14,weight: FontWeight.w600,color: Color(0xffFFFFFF,),),
                    subtitle:  ReusableText(title: 'episode 26',size: 14,weight: FontWeight.w500,color: Color(0xffFFFFFF,),),
                    trailing: Icon(Icons.download,color: Color(0xffFFFFFF),),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Image(image: AssetImage("Asset/images/Movie/M5.png"),),
                    title:  ReusableText(title: 'Copyright infregment',size: 14,weight: FontWeight.w600,color: Color(0xffFFFFFF,),),
                    subtitle:  ReusableText(title: 'episode 26',size: 14,weight: FontWeight.w500,color: Color(0xffFFFFFF,),),
                    trailing: Icon(Icons.download,color: Color(0xffFFFFFF),),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
