import 'package:flutter/material.dart';
import 'package:vibetag/screens/auth/add_photo.dart';
import 'package:vibetag/screens/auth/forgot_old.dart';
import 'package:vibetag/screens/home/home.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/select_field.dart';

class LoginOld extends StatefulWidget {
  const LoginOld({super.key});

  @override
  State<LoginOld> createState() => _LoginOldState();
}

class _LoginOldState extends State<LoginOld> {
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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: height * 0.04,
                  width: width,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.01,
                  ),
                  child: Image.asset('assets/images/logo.png'),
                ),
                Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.3,
                      decoration: const BoxDecoration(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                  height: height * 0.57,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TabBar(
                              unselectedLabelColor:
                                  Color.fromARGB(255, 196, 194, 194),
                              labelColor: Color.fromARGB(255, 255, 255, 255),
                              indicatorColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              labelStyle: TextStyle(
                                fontSize: 24,
                              ),
                              tabs: [
                                Tab(
                                  text: 'Log in',
                                ),
                                Tab(
                                  text: 'Sign Up',
                                ),
                              ],
                            ),
                            Container(
                              width: width * 1,
                              height: height * 0.5,
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.05,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              InputField(
                                                title: 'Email',
                                                hintText: 'someone@gmail.com',
                                                controller: emailController,
                                              ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              InputField(
                                                title: 'Password',
                                                hintText: '************',
                                                controller: emailController,
                                                isObscure: true,
                                              ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Checkbox(
                                                          value: isRemembered,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              isRemembered =
                                                                  value;
                                                            });
                                                          },
                                                          checkColor:
                                                              Colors.black,
                                                          focusColor:
                                                              Colors.black,
                                                          activeColor:
                                                              Colors.white,
                                                        ),
                                                      ),
                                                      const Text(
                                                        'Remember Me',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      pushRoute(
                                                        context: context,
                                                        screen:
                                                            const ForgotPasswordOld(),
                                                      );
                                                    },
                                                    child: const Text(
                                                      'Forgot Password?',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: height * 0.05,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  pushReplacement(
                                                    context: context,
                                                    screen: Home(),
                                                  );
                                                },
                                                child: Center(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: width * 0.7,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: width * 0.05,
                                                      vertical: height * 0.01,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              width * 0.01),
                                                      color: Colors.white,
                                                    ),
                                                    child: const Text(
                                                      'Login',
                                                      style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        'Don\'t have an Account?'),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'Register',
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Sign Up Tab Code Section
                                  Container(
                                    height: height * 0.58,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.05,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  InputField(
                                                    title: 'User name',
                                                    hintText: 'Name Here',
                                                    controller:
                                                        userNameController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  InputField(
                                                    title: 'E-mail Address',
                                                    hintText:
                                                        'someone@gmail.com',
                                                    controller: emailController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  InputField(
                                                    title: 'Password',
                                                    hintText: '************',
                                                    controller:
                                                        passowrdController,
                                                    isObscure: true,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  InputField(
                                                    title: 'Confirm Password',
                                                    hintText: '************',
                                                    controller:
                                                        confirmPasswordController,
                                                    isObscure: true,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'Eye Color',
                                                    items: const [
                                                      'Select',
                                                      'Black',
                                                      'green',
                                                      'white',
                                                      'rose',
                                                      'gray'
                                                    ],
                                                    controller: eyeController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'Hair Color',
                                                    items: const [
                                                      'Select',
                                                      'Black',
                                                      'green',
                                                      'white',
                                                    ],
                                                    controller: hairController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'Religion',
                                                    items: const [
                                                      'Select',
                                                      'Islam',
                                                      'Cristain',
                                                      'Eteist',
                                                    ],
                                                    controller:
                                                        religionController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'Smoke',
                                                    items: const [
                                                      'Select',
                                                      'Yes',
                                                      'No',
                                                    ],
                                                    controller: smokeController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'With Children',
                                                    items: const [
                                                      'Select',
                                                      'Yes',
                                                      'No',
                                                    ],
                                                    controller:
                                                        childrenController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'Pets',
                                                    items: const [
                                                      'Select',
                                                      'Yes',
                                                      'No',
                                                    ],
                                                    controller: petsController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'Education',
                                                    items: const [
                                                      'Select',
                                                      'Yes',
                                                      'No',
                                                    ],
                                                    controller:
                                                        educationController,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SelectField(
                                                    title: 'Gender',
                                                    items: const [
                                                      'Select',
                                                      'Male',
                                                      'Femal',
                                                      'Other',
                                                    ],
                                                    controller:
                                                        genderController,
                                                  ),
                                                  Container(
                                                    width: width * 0.9,
                                                    height: height * 0.1,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Checkbox(
                                                            value: isRemembered,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                isRemembered =
                                                                    value;
                                                              });
                                                            },
                                                            checkColor:
                                                                Colors.black,
                                                            focusColor:
                                                                Colors.black,
                                                            activeColor:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                        const Expanded(
                                                          child: Text(
                                                            'By Creating your account, you\'re agree to our Terms of user & Privacy Policy',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.05,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      pushReplacement(
                                                        context: context,
                                                        screen: AddPhoto(),
                                                      );
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: width * 0.7,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              width * 0.05,
                                                          vertical:
                                                              height * 0.01,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      width *
                                                                          0.01),
                                                          color: Colors.white,
                                                        ),
                                                        child: const Text(
                                                          'Sign up',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            'Already have an Account?'),
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: const Text(
                                                            'Login',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.05,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
