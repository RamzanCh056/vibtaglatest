import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vibetag/screens/register/reusabletext.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
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
                      currentStep: 16,
                      progressColor: const Color(0xffFF9243),
                      backgroundColor: const Color(0xffF1F4FB),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "16/16",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Image(

                    image: AssetImage("Asset/icons/register/Group 27.png")),
              ),
              const SizedBox(
                height: 10,
              ),
              const   Center(
                child: ReusableText(
                  title: "Congratulations!",
                  color: Color(0xffFF9243),
                  size: 24,
                  weight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const   Center(
                child: ReusableText(
                  title: "Your profile has been approved successfully",
                  color: Color(0xff7D8CAC),
                  size: 14,
                  weight: FontWeight.w600,
                ),
              ),
              const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
