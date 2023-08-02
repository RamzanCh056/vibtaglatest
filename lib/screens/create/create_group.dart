import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/screens/movie/movie_screen.dart';
import '../register/reusabletext.dart';


class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Center(child: ReusableText(title: 'Create Group',weight: FontWeight.w700,size: 22,color: Color(0xff120D26),)),
          SizedBox(height:
          15,),
          Divider(thickness: 6,height: 6,color: Color(0xffF1F4FB),),
          SizedBox(height:
          15,),
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
          20,),
          ReusableText(title: 'Name',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
          SizedBox(height:
          10,),
          TextField(
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color(0xffC8D1E5)
                    )
                ),
                hintText: "Movie Gossips",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color:Color(0xffC8D1E5)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffC8D1E5)))),
          ),
          SizedBox(height:
          10,),
          ReusableText(title: 'Location',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
          SizedBox(height:
          10,),
          TextField(
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color(0xffC8D1E5)
                    )
                ),

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color:Color(0xffC8D1E5)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffC8D1E5)))),
          ),
          SizedBox(height:
          15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(title: 'Start Date',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month_rounded,color: Color(0xffC8D1E5),),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xffC8D1E5)
                              )
                          ),
                          hintText: "12-Feb-2023",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xffC8D1E5)
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(title: 'Start Time',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.watch_later,color: Color(0xffC8D1E5),),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xffC8D1E5)
                              )
                          ),
                          hintText: "00:00",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xffC8D1E5)
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height:
          15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(title: 'End Date',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month_rounded,color: Color(0xffC8D1E5),),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xffC8D1E5)
                              )
                          ),
                          hintText: "12-Feb-2023",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xffC8D1E5)
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(title: 'End Time',weight: FontWeight.w700,size: 16,color: Color(0xff120D26),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.watch_later,color: Color(0xffC8D1E5),),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xffC8D1E5)
                              )
                          ),
                          hintText: "00:00",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xffC8D1E5)
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height:
          15,),
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
                    borderSide: const BorderSide(color: Color(0xffC8D1E5)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xffC8D1E5)))),
          ),
          SizedBox(height:
          15,),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieScreen()));
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
    ),));
  }
}
