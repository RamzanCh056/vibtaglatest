import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:vibetag/screens/create/create_group.dart';
import 'package:vibetag/screens/register/reusabletext.dart';

class Createpage extends StatefulWidget {
  const Createpage({Key? key}) : super(key: key);

  @override
  State<Createpage> createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(title: 'Cover Image',weight: FontWeight.w700,size: 16,color: Color(0xff212121),),
                    SizedBox(height:
                    10,),
                    ReusableText(title: 'Recommended Ratio of 12:9.',weight: FontWeight.w400,size: 12,color: Color(0xff485470),),
                  ],
                ),
                Spacer(),
                DottedBorder(
                  borderType: BorderType.RRect,
                  padding: EdgeInsets.all(0),
                  radius: Radius.circular(10),
                  color: Color(0xffC8D1E5),
                  strokeWidth: 4,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F4FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xff485470),
                        ),
                        SizedBox(width: 10,),
                        ReusableText(
                          title: 'Upload',
                          size: 13,
                            weight: FontWeight.w600,
                          color: Color(0xff485470),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Image(
              width: MediaQuery.of(context).size.width*1,
            image: AssetImage("Asset/images/Rectangle 23850.png")),
            Divider(thickness: 6,height: 6,color: Color(0xffF1F4FB),),
            SizedBox(height:
              10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(title: 'Profile Image',weight: FontWeight.w700,size: 16,color: Color(0xff212121),),
                    SizedBox(height:
                    10,),
                    ReusableText(title: 'Recommended Ratio of 1:1',weight: FontWeight.w400,size: 12,color: Color(0xff485470),),
                  ],
                ),
                Spacer(),
                DottedBorder(
                  borderType: BorderType.RRect,
                  padding: EdgeInsets.all(0),
                  radius: Radius.circular(10),
                  color: Color(0xffC8D1E5),
                  strokeWidth: 4,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F4FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xff485470),
                        ),
                        SizedBox(width: 10,),
                        ReusableText(
                          title: 'Upload',
                          size: 13,
                          weight: FontWeight.w600,
                          color: Color(0xff485470),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height:
            20,),
            Center(
              child: Image(
                  image: AssetImage("Asset/images/Group 1000002501.png")),
            ),
            SizedBox(height:
            20,),
            Divider(thickness: 6,height: 6,color: Color(0xffF1F4FB),),
            SizedBox(height:
            20,),
            ReusableText(title: 'Name',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
            SizedBox(height:
            10,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintText: "Movie Gossips",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height:
            10,),
            ReusableText(title: 'URL Link',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
            SizedBox(height:
            10,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Container(
                    height: 56,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF1F4FB)
                    ),
                    child:Center(child: ReusableText(title: 'Group ID Link',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),)),
                  ),
                ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintText: "    moviegossibs",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height:
            10,),
            ReusableText(title: 'Category',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
            SizedBox(height:
            10,),

            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff99A7C7),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintText: "Entertainment",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height:
            10,),
            ReusableText(title: 'Group Type',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
            SizedBox(height:
            10,),

            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff99A7C7),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintText: "Public",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color:Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height:
            10,),
            ReusableText(title: 'Description',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
            SizedBox(height:
            10,),
            TextField(
              maxLines: 5,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintText: "Enter here",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color:Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height:
            10,),
            Row(
              children: [
                InkWell(
                  child:
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width*0.47,
                    decoration: BoxDecoration(
                        color: const Color(0xffF1F4FB),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: ReusableText(title: "Cancel",color: Color(0xff7D8CAC),weight: FontWeight.w800,size: 17,),
                    ),
                  ),
                ),
              Spacer(),
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroup()));
                    });
                  },
                  child:
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width*0.47,
                    decoration: BoxDecoration(
                        gradient: const  LinearGradient(colors:[
                          Color(0xffFFC107),
                          Color(0xffFF8205),
                        ]

                        ),
                        color: const Color(0xffCCCCCC),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: ReusableText(title: "Save",color: Colors.white,weight: FontWeight.w800,size: 17,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20
              ,)
          ],
        ),
      ),
    ));
  }
}
