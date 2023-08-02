import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vibetag/screens/register/birthday.dart';
import 'package:vibetag/screens/register/reusabletext.dart';


class SignUpThree extends StatefulWidget {
  const SignUpThree({Key? key}) : super(key: key);

  @override
  State<SignUpThree> createState() => _SignUpThreeState();
}

class _SignUpThreeState extends State<SignUpThree> {
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
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                    child: LinearProgressBar(
                      maxSteps: 16,
                      minHeight: 10,
                      progressType: LinearProgressBar
                          .progressTypeLinear, // Use Linear progress
                      currentStep: 3,
                      progressColor: const Color(0xffFF9243),
                      backgroundColor: const Color(0xffF1F4FB),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  const Text(
                    "3/16",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
           const SizedBox(height: 15,),
           Row(
             children: const [
               Image(
                 height: 30,width: 30,
                   image: AssetImage("Asset/icons/register/hand.png")),
               SizedBox(width: 15,),
               ReusableText(title: 'Whats your name?',weight: FontWeight.w700,size: 20,color: Color(0xff212121),)
             ],
           ),
              const SizedBox(height: 15,),
              const ReusableText(title: "Tell us more about you! People inside use\ntheir real names.",color: Color(0xff7D8CAC),size: 14,weight: FontWeight.w400,),
              const SizedBox(height: 20,),
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xffC8D1E5)
                    )
                  ),
                    hintText: "Mark",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade600))),
              ),
              const SizedBox(height: 15,),
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color(0xffC8D1E5)
                        )
                    ),
                    hintText: "Daniel",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade600))),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width*1,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpFour()));
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
