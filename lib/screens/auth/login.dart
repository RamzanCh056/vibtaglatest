import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/auth/forgot.dart';
import 'package:vibetag/screens/auth/register.dart';
import 'package:vibetag/screens/home/home.dart';

import '../../utils/constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int pageIndex = 0;

  bool isRemembered = true;
  bool isMounted = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);

  void SliderScroll() {
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (!isMounted) {
          if (pageIndex == 2) {
            setState(() {
              pageIndex = 0;
            });
          } else {
            setState(() {
              pageIndex++;
            });
          }

          _pageController.animateToPage(pageIndex,
              duration: Duration(milliseconds: 1000), curve: Curves.easeInSine);
        }
      },
    );
  }

  void loginUser() async {
    final Map<String, String> data = {
      'type': 'user_login',
      'username': email.text.toString(),
      'password': password.text.toString(),
    };
    print(data);
    final result = await API().postData(data);
    final response = json.decode(result.body);
    if (response['api_text'] == 'success') {
      setState(() {
        isMounted = true;
      });
      pushReplacement(
        context: context,
        screen: const Home(),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    SliderScroll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height =
        deviceHeight(context: context) + MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: height * 0.065,
                    child: Container(
                      width: width * 0.35,
                      height: height * 0.32,
                      margin: spacing(
                        horizontal: width * 0.185,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(12),
                      ),
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Center(
                            child: Container(
                              child: Image.asset(
                                'assets/images/home1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Image.asset(
                                'assets/images/home2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Image.asset(
                                'assets/images/home3.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: width * 0.7,
                      height: height * 0.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            'assets/images/login_frame.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: spacing(
                  horizontal: 2,
                ),
                decoration: BoxDecoration(
                  color: lightGrayNew2,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: spacing(
                        horizontal: 19,
                        vertical: 27,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back !',
                            style: TextStyle(
                              color: accent,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: width * 0.75,
                            child: Text(
                              'Discover a modern social networking and explore',
                              style: TextStyle(
                                color: lightblue,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Container(
                            height: 56,
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: 'abc@gmail.com',
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: lightblue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: lightGrayNew,
                                      ),
                                      borderRadius: borderRadius(12),
                                    ),
                                    prefix: Container(
                                      width: 40,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 18,
                                  left: 15,
                                  child: Container(
                                    child: Image.asset(
                                      'assets/icons/Mail.png',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Container(
                            height: 56,
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: lightblue),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: lightGrayNew,
                                      ),
                                      borderRadius: borderRadius(12),
                                    ),
                                    prefix: Container(
                                      width: 40,
                                      height: 20,
                                    ),
                                    suffix: Container(
                                      width: 40,
                                      height: 20,
                                    ),
                                  ),
                                  obscureText: true,
                                ),
                                Positioned(
                                  top: 18,
                                  left: 15,
                                  child: Container(
                                    child: Image.asset(
                                      'assets/icons/lock.png',
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 18,
                                  right: 15,
                                  child: Container(
                                    child: Image.asset(
                                      'assets/icons/hide.png',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Switch(
                                    value: isRemembered,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          isRemembered = value;
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      color: lightblue,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isMounted = true;
                                  });
                                  pushReplacement(
                                    context: context,
                                    screen: const ForgotPassword(),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: lightblue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          InkWell(
                            onTap: () {
                              loginUser();
                            },
                            child: Container(
                              height: 58,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    HexColor('#FFC107'),
                                    HexColor('#FF8205'),
                                  ],
                                ),
                                borderRadius: borderRadius(12),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    top: 0,
                                    right: 10,
                                    child: Center(
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: lightBg,
                                          borderRadius: borderRadius(32),
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 13,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have any account!',
                                style: TextStyle(
                                  color: lightblue,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isMounted = true;
                                  });
                                  pushReplacement(
                                    context: context,
                                    screen: const Register(),
                                  );
                                },
                                child: Text(
                                  ' Register',
                                  style: TextStyle(
                                    color: orange,
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
