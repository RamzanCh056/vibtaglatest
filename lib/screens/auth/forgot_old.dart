import 'package:flutter/material.dart';
import 'package:vibetag/screens/auth/login_old.dart';
import 'package:vibetag/widgets/input_field.dart';

import '../../utils/constant.dart';

class ForgotPasswordOld extends StatefulWidget {
  const ForgotPasswordOld({super.key});

  @override
  State<ForgotPasswordOld> createState() => _ForgotPasswordOldState();
}

class _ForgotPasswordOldState extends State<ForgotPasswordOld> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: height * 0.04,
                    width: width,
                    decoration: BoxDecoration(
                      color: accent,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                    ),
                    child: Image.asset('assets/images/logo.png'),
                  ),
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
                  Container(
                    width: width,
                    height: height * 0.66,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.8,
                          color: Colors.white,
                          height: 2,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 35,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: borderRadius(10),
                          ),
                          child: const Text(
                            'Emails has send successfully',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: width * 0.8,
                          child: InputField(
                            title: 'Email',
                            hintText: 'someone@gmail.com',
                            controller: email,
                            textColor: '#ffffff',
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: width * 0.5,
                          padding: spacing(
                            horizontal: 35,
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: borderRadius(10),
                          ),
                          child: const Text(
                            'Recover',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushReplacement(
                                  context: context,
                                  screen: LoginOld(),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account? ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushReplacement(
                                  context: context,
                                  screen: LoginOld(),
                                );
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
