import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vibetag/screens/register/city.dart';
import 'package:vibetag/screens/register/reusabletext.dart';


class IdentityScreen extends StatefulWidget {
  const IdentityScreen({Key? key}) : super(key: key);

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  bool _isVisible = false;
  bool _isVisible1 = false;
  bool _isVisible2 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                    child: LinearProgressBar(
                      maxSteps: 16,
                      minHeight: 10,
                      progressType: LinearProgressBar
                          .progressTypeLinear, // Use Linear progress
                      currentStep: 5,
                      progressColor: const Color(0xffFF9243),
                      backgroundColor: const Color(0xffF1F4FB),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  const Text(
                    "5/16",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: const [
                  Image(
                      height: 30,width: 30,
                      image: AssetImage("Asset/icons/register/id.png")),
                  SizedBox(width: 15,),
                  ReusableText(title: 'How do you identify?',weight: FontWeight.w700,size: 20,color: Color(0xff212121),)
                ],
              ),
              const SizedBox(height: 15,),
              const ReusableText(title: "Tell us more about you! We need this for\ncommunity safety.",color: Color(0xff7D8CAC),size: 14,weight: FontWeight.w400,),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  setState(() {
                    _isVisible=!_isVisible;
                    _isVisible1=false;
                    _isVisible2=false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(color:_isVisible?Color(0xff000000) :Color(0xffC8D1E5),
                    ),
                  ),
                  child: Row(
                    children: [
                      ReusableText(title:'Male',size:16 ,weight: FontWeight.w600,color: _isVisible?Color(0xff000000) :Color(0xffC8D1E5),),
                     Spacer(),
                      Visibility(
                          visible: _isVisible,
                          child: Icon(Icons.done,color: Colors.black,))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  setState(() {
                    _isVisible1=!_isVisible1;
                    _isVisible=false;
                    _isVisible2=false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(color:_isVisible1?Color(0xff000000) :Color(0xffC8D1E5),
                    ),
                  ),
                  child: Row(
                    children: [
                      ReusableText(title:'Female',size:16 ,weight: FontWeight.w600,color: _isVisible1?Color(0xff000000) :Color(0xffC8D1E5),),
                      Spacer(),
                      Visibility(
                          visible: _isVisible1,
                          child: Icon(Icons.done,color: Colors.black,))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  setState(() {
                    _isVisible2=!_isVisible2;
                    _isVisible1=false;
                    _isVisible=false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(color:_isVisible2?Color(0xff000000) :Color(0xffC8D1E5),
                    ),
                  ),
                  child: Row(
                    children: [
                      ReusableText(title:'Others',size:16 ,weight: FontWeight.w600,color: _isVisible2?Color(0xff000000) :Color(0xffC8D1E5),),
                      Spacer(),
                      Visibility(
                          visible: _isVisible2,
                          child: Icon(Icons.done,color: Colors.black,))
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width*1,
                child: InkWell(
                  onTap: (){
            setState(() {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
            });
                  },
                  child:
                  Container(
                    height: 50,
                    width: 274,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ReusableText(title: "Save and Continue",color: Colors.white,weight: FontWeight.w800,size: 17,),
                          SizedBox(width: 20,),
                          Icon(Icons.arrow_circle_right_sharp,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
