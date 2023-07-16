import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import '../../../utils/constant.dart';
import '../drawer.dart';

class DownloadSettings extends StatefulWidget {
  const DownloadSettings({Key? key}) : super(key: key);

  @override
  State<DownloadSettings> createState() => _DownloadSettingsState();
}

class _DownloadSettingsState extends State<DownloadSettings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isRemembered = true;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height =
        deviceHeight(context: context) + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(title: Text("Download", style: TextStyle(color:Colors.white),),),
      body: Scaffold(
        body: SingleChildScrollView(

          child: Column(children: [
            SizedBox(height: 15,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                   height: 150,
                   width: 150,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Color(0xffFF9200))
                   ),
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           height: 30,
                           width: 30,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Color(0xffF1F4FB)
                           ),

                           child:  Center(child: Icon(Icons.warning, color: Color(0xffFF9200),size: 18,)),
                         ),
                         SizedBox(height: 15,),
                         Text("My Information", style: TextStyle(color: Color(0xffFF9200)),),
                       ],
                     ),
                   )
               ),
             Container(
                 height: 150,
                 width: 150,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.grey.shade400)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         height: 30,
                         width: 30,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Color(0xffF1F4FB)
                         ),

                         child:  Center(child: Icon(Icons.file_copy_rounded, color: Colors.grey.shade400,size: 18,)),
                       ),
                       SizedBox(height: 15,),
                       Text("My Post"),
                     ],
                   ),
                 )
             )

           ],),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF1F4FB)
                            ),

                            child:  Center(child: Icon(Icons.pages, color: Colors.grey.shade400,size: 18,)),
                          ),
                          SizedBox(height: 15,),
                          Text("My Pages"),
                        ],
                      ),
                    )
                ),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF1F4FB)
                            ),

                            child:  Center(child: Icon(Icons.group, color: Colors.grey.shade400,size: 18,)),
                          ),
                          SizedBox(height: 15,),
                          Text("My Groups"),
                        ],
                      ),
                    )
                )

              ],),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF1F4FB)
                            ),

                            child:  Center(child: Icon(Icons.person, color: Colors.grey.shade400,size: 18,)),
                          ),
                          SizedBox(height: 15,),
                          Text("My Followers"),
                        ],
                      ),
                    )
                ),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF1F4FB)
                            ),

                            child:  Center(child: Icon(Icons.person_rounded, color: Colors.grey.shade400,size: 18,)),
                          ),
                          SizedBox(height: 15,),
                          Text("My Following"),
                        ],
                      ),
                    )
                )

              ],),
            SizedBox(height: 15,),




          ],),
        ),
      ),

    );

  }

}
