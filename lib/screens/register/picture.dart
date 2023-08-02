import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vibetag/screens/register/follow.dart';
import 'package:vibetag/screens/register/reusabletext.dart';

class PictureScreen extends StatefulWidget {
  const PictureScreen({Key? key}) : super(key: key);

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
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
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: LinearProgressBar(
                      maxSteps: 16,
                      minHeight: 10,
                      progressType: LinearProgressBar
                          .progressTypeLinear, // Use Linear progress
                      currentStep: 7,
                      progressColor: const Color(0xffFF9243),
                      backgroundColor: const Color(0xffF1F4FB),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "7/16",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Image(
                      height: 30,
                      width: 30,
                      image: AssetImage("Asset/icons/register/profile.png")),
                  SizedBox(
                    width: 15,
                  ),
                  ReusableText(
                    title: 'Add a profile picture',
                    weight: FontWeight.w700,
                    size: 20,
                    color: Color(0xff212121),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const ReusableText(
                title: "Your profile picture must have your face in it.",
                color: Color(0xff7D8CAC),
                size: 14,
                weight: FontWeight.w400,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xffF1F4FB),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Color(0xff7D8CAC),
                        size: 70,
                      ),
                      onPressed: () {
                        // setState(() {
                        //   showDialog(context: context, builder: (BuildContext context) {
                        //     return Column(
                        //       children: [
                        //         Row(
                        //           children:const  [
                        //             ReusableText(title: 'Cancel',size: 18,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                        //             Spacer(),
                        //             ReusableText(title: 'Save',size: 18,weight: FontWeight.w700,color: Color(0xff3399FF),),
                        //           ],
                        //         ),
                        //       ],
                        //     );
                        //   },);
                        // }
                        //
                        // );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: ReusableText(
                  title: "Just Perfect",
                  color: Color(0xff00AB82),
                  size: 14,
                  weight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FollowScreen()));
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 274,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xffFFC107),
                          Color(0xffFF8205),
                        ]),
                        color: const Color(0xffCCCCCC),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ReusableText(
                            title: "Save and Continue",
                            color: Colors.white,
                            weight: FontWeight.w800,
                            size: 17,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_circle_right_sharp,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 274,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffFFC107)),
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: ReusableText(
                        title: "Re-Take the photo",
                        color: Color(0xffFF8605),
                        weight: FontWeight.w800,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
