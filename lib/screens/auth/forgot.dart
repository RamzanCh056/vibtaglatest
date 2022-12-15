import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/auth/register.dart';

import '../../utils/constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isRemembered = true;
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
            children: [
              Container(
                width: width,
                height: height * 0.32,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      'assets/images/auth_bg.png',
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: height * 0.15,
                      left: 20,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Share Your Vibe',
                              style: TextStyle(
                                color: white,
                                fontSize: textXl,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              width: width * 0.8,
                              child: Text(
                                'Discover a modern social networking and explore new imaginations, skills and creative ideas! Vibe your life. Vibe it.',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: darkGray,
                                    borderRadius: borderRadius(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: darkGray,
                                    borderRadius: borderRadius(10),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.54,
                padding: spacing(
                  horizontal: 19,
                  vertical: 27,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Your Password!',
                      style: TextStyle(
                        color: accent,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: width * 0.9,
                      child: Text(
                        'Please enter your email address to request a password reset',
                        style: TextStyle(
                          color: accent,
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
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
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
                                'RESET',
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
                    const SizedBox(
                      height: 18,
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
              Container(
                width: width,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        child: Image.asset(
                          'assets/icons/Polygon2.png',
                        ),
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        'assets/icons/Polygon3.png',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
