import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:vibetag/screens/movie/continue_watching.dart';
import 'package:vibetag/screens/register/reusabletext.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late PageController controller = PageController();

  GlobalKey<PageContainerState> key = GlobalKey();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff3D3D3D),
      body: ListView(
        children: [
          // Row(
          //   children: [
          //     Image(image: AssetImage("Asset/images/Movie/image 27.png")),
          //     Spacer(),
          //     Container(
          //       padding: EdgeInsets.all(7),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Color(0xff3D3D3D),
          //
          //       ),
          //       child: Center(child: ReusableText(title: 'My Vibes',size: 12,weight: FontWeight.w600,color: Color(0xffFFFFFF),)),
          //     ),
          //     SizedBox(width: 10,),
          //     Container(
          //       padding: EdgeInsets.all(7),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Color(0xff3D3D3D),
          //
          //       ),
          //       child: Center(child: ReusableText(title: 'Set up',size: 12,weight: FontWeight.w600,color: Color(0xffFFFFFF),)),
          //     ),
          //     SizedBox(width: 10,),
          //     Container(
          //       padding: EdgeInsets.all(7),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Color(0xff3D3D3D),
          //       ),
          //       child: Center(
          //         child: Stack(children:[ Icon(Icons.notifications,color: Color(0xffFFFFFF),),
          //         Positioned(
          //           right: 5,top: 4,
          //           child: Container(
          //             height: 7,width: 7,decoration: BoxDecoration(
          //             shape: BoxShape.circle,color: Color(0xffFF4C4B)
          //           ),
          //           ),
          //         )
          //         ]),
          //       ),
          //     ),
          //     SizedBox(width: 10,),
          //     Container(
          //       padding: EdgeInsets.all(7),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Color(0xff3D3D3D),
          //       ),
          //       child: Center(
          //         child: Stack(children:[ Icon(Icons.person_rounded,color: Color(0xffFFFFFF),),
          //           Positioned(
          //             right: 5,top: 4,
          //             child: Container(
          //               height: 7,width: 7,decoration: BoxDecoration(
          //                 shape: BoxShape.circle,color: Color(0xffFF4C4B)
          //             ),
          //             ),
          //           )
          //         ]),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(color: Color(0xffFE9700)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.74,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        suffixIcon: Image(
                          height: 30,width: 30,
                          image: AssetImage("Asset/icons/movie/adjust.png"),),
                        hintStyle: TextStyle(
                            fontSize: 14,fontWeight: FontWeight.w500,
                            color: Color(0xff99A7C7)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff99A7C7),
                        ),
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:BorderSide.none,
                        ),
                        hintText: "Search for anything",
                        // focusedBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        //   borderSide: const BorderSide(
                        //     color: Color(0xffC8D1E5),
                        //   ),
                        // ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        //   borderSide: BorderSide(
                        //     color: Color(0xffC8D1E5),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFFFFF)
                    ),
                    child: Center(
                      child:
                     Image(
                       height: 30,width: 30,
                       image: AssetImage("Asset/icons/movie/Chat-3.png"),)
                    ),
                  ),
                  SizedBox(width: 5,),
                  Icon(Icons.more_vert,color: Colors.white,)
                ],
              ),
            ),
          ),
          Image(
              fit: BoxFit.cover,
              image: AssetImage("Asset/images/Movie/Group 1000003691.png")),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: PageIndicatorContainer(
              key: key,
              child: PageView(
                children: <Widget>[],
                controller: controller,
                reverse: true,
              ),
              align: IndicatorAlign.bottom,
              length: 4,
              indicatorSpace: 10.0,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,fillColor: Colors.black,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff5C5C5C),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    hintStyle: TextStyle(color: Color(0xff5C5C5C)),
                    hintText: "Enter here",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap:(){
                        setState(() {
                          _currentIndex=0;
                        });
                      },
                      child: Container(
                        width:60,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:_currentIndex==0?Color(0xffFFFFFF):Color(0xff000000)
                      ),
                      child: Center(
                        child: ReusableText(
                          title: 'All',
                          size: 14,weight: FontWeight.w600,
                          color:_currentIndex==0?Color(0xff232323):Color(0xffBBBBBB) ,
                        ),
                      ),
                        ),
                    ),
                    SizedBox(width: 15,),
                    InkWell(
                      onTap:(){
                        setState(() {
                          _currentIndex=1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:_currentIndex==1?Color(0xffFFFFFF):Color(0xff000000)
                        ),
                        child: Center(
                          child: ReusableText(
                            title: 'Action',
                            size: 14,weight: FontWeight.w600,
                            color: _currentIndex==1?Color(0xff232323):Color(0xffBBBBBB) ,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    InkWell(
                      onTap:(){
                        setState(() {
                          _currentIndex=2;
                        });
                      },
                      child: Container(

                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:_currentIndex==2?Color(0xffFFFFFF):Color(0xff000000)
                        ),
                        child: Center(
                          child: ReusableText(
                            title: 'Adventure',
                            size: 14,weight: FontWeight.w600,
                            color: _currentIndex==2?Color(0xff232323):Color(0xffBBBBBB) ,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    InkWell(
                      onTap:(){
                        setState(() {
                          _currentIndex=3;
                        });
                      },
                      child: Container(

                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:_currentIndex==3?Color(0xffFFFFFF):Color(0xff000000)
                        ),
                        child: Center(
                          child: ReusableText(
                            title: 'Animated',
                            size: 14,weight: FontWeight.w600,
                            color: _currentIndex==3?Color(0xff232323):Color(0xffBBBBBB) ,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 15,),
              _currentIndex==0?ContinueWatching() :Container()
            ],
          ),)
        ],
      ),
    ));
  }
}
