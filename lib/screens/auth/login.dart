import 'package:flutter/material.dart';
import 'package:vibetag/screens/auth/add_photo.dart';
import 'package:vibetag/screens/auth/singnup_screen.dart';
import 'package:vibetag/screens/auth/forgot.dart';
import 'package:vibetag/screens/home/home.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/select_field.dart';

import 'login_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController eyeController = TextEditingController();
  TextEditingController hairController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController childrenController = TextEditingController();
  TextEditingController petsController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool? isRemembered = false;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(

              child: Container(
                  color:  Colors.orange,
                  height: 800,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.05,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                          scale: width * 0.03,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.3,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: AssetImage('assets/images/streamer.jpg'),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: height * 0.03,
                                  left: width * 0.07,
                                  child: const Text(
                                    'VibeTag',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: height * 0.12,
                                  left: width * 0.07,
                                  child: const Text(
                                    'Start VibeTag',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: height * 0.17,
                                  left: width * 0.07,
                                  child: Container(
                                    width: width * 0.7,
                                    child: const Text(
                                      'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: height * 0.02,
                                  left: width * 0.25,
                                  child: Container(
                                    width: width * 0.2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: width * 0.02,
                                          height: width * 0.02,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.02,
                                            ),
                                            color: Colors.white54,
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.02,
                                          height: width * 0.02,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.02,
                                            ),
                                            color: Colors.white12,
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.02,
                                          height: width * 0.02,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.02,
                                            ),
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.orange,
                        child: TabBar(
                          unselectedLabelColor:
                          Color.fromARGB(255, 196, 194, 194),
                          labelColor: Color.fromARGB(255, 255, 255, 255),
                          indicatorColor:
                          Color.fromARGB(255, 255, 255, 255),
                          labelStyle: TextStyle(
                            fontSize: 24,
                          ),
                          tabs: [
                            Tab(text: "Log In"),
                            Tab(text: "Register"),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TabBarView(
                          children: [
                            LoginScreen(),
                            SignupScreen(),
                          ],
                        ),
                      ),

                      Container(
                        //height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("C 2020 Vibetag", style: TextStyle(
                                        color: Colors.black, fontSize: 16
                                    ),),
                                    Text("Language",style: TextStyle(
                                        color: Colors.black, fontSize: 16
                                    ),),

                                  ],),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("About", style: TextStyle(
                                        color: Colors.blue, fontSize: 14
                                    ),),
                                    SizedBox(width: 10,),
                                    Text("Blog",style: TextStyle(
                                        color: Colors.blue, fontSize: 14
                                    ),),
                                    SizedBox(width: 10,),
                                    Text("Verification",style: TextStyle(
                                        color: Colors.blue, fontSize: 14
                                    ),),
                                    SizedBox(width: 10,),
                                    Text("More",style: TextStyle(
                                        color: Colors.blue, fontSize: 14
                                    ),),

                                  ],),
                                SizedBox(height: 2,),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ));



















  }
}
