import 'package:flutter/material.dart';
import 'package:vibetag/screens/register/reusabletext.dart';

class RequestSubmitted extends StatefulWidget {
  const RequestSubmitted({Key? key}) : super(key: key);

  @override
  State<RequestSubmitted> createState() => _RequestSubmittedState();
}

class _RequestSubmittedState extends State<RequestSubmitted> {
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
Spacer(),
              Center(
                child: Image(
                    image: AssetImage("Asset/icons/register/Group 27.png")),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ReusableText(
                  title: "Request Submitted",
                  color: Color(0xffFF9243),
                  size: 21,
                  weight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const   Center(
                child: ReusableText(
                  alignment: TextAlign.center,
                  title: "Your request to verify this account is currently\nunder review. You can expect a response\nwithin 30 days",
                  color: Color(0xff7D8CAC),
                  size: 14,
                  weight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,width: MediaQuery.of(context).size.width*0.46,
                      decoration: BoxDecoration(

                          color: const Color(0xffF1F4FB),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: ReusableText(
                          title: "Back",
                          color: Color(0xff485470),
                          weight: FontWeight.w800,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.46,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color(0xffFFC107),
                            Color(0xffFF8205),
                          ]),
                          color: const Color(0xffCCCCCC),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: ReusableText(
                          title: "Next",
                          color: Colors.white,
                          weight: FontWeight.w800,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
