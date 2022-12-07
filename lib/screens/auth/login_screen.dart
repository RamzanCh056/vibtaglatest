import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vibetag/screens/auth/add_photo.dart';
import 'package:vibetag/screens/auth/after_registration.dart';
import '../../res/static_info.dart';
import '../../utils/constant.dart';
import '../../widgets/input_field.dart';
import 'forgot.dart';
import '../home/home.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isRemembered = false;
  var message;
  var errorText;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                InputField(

                    title: 'Email',
                    hintText: 'someone@gmail.com',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty ) {
                        return 'This field is required';
                      }
                    }
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InputField(

                    title: 'Password',
                    hintText: '************',
                    controller: passwordController,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }

                ),
                SizedBox(
                  height: height * 0.03,
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
                          const ForgotPassword(),
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
                  height: height * 0.03,
                ),
                isLoading
                    ? const Center(
                  child: SizedBox(
                      width: 90,
                      child:
                      //Image.asset("images/loading.gif")
                      LoadingIndicator(
                          indicatorType: Indicator.ballBeat,
                          colors: [Colors.deepPurple],
                          strokeWidth: 2,
                          pathBackgroundColor: Colors.blue)
                  ),
                ):
                InkWell(
                  onTap: () {

                    if (formKey.currentState!.validate()) {
                      loginfun();
                    }

                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.7,
                      padding: EdgeInsets.symmetric(
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
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    const Text(
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



              ],
            ),
          ),
        ),
        // Expanded(
        //
        //   child: SingleChildScrollView(
        //
        //       child: Column(children: [],)
        //   ),
        // ),
        // Container(
        //   //height: 60,
        //   width: double.infinity,
        //   color: Colors.white,
        //   child: Center(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text("C 2020 Vibetag", style: TextStyle(
        //                   color: Colors.black, fontSize: 16
        //               ),),
        //               Text("Language",style: TextStyle(
        //                   color: Colors.black, fontSize: 16
        //               ),),
        //
        //             ],),
        //           SizedBox(height: 10,),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             children: [
        //               Text("About", style: TextStyle(
        //                   color: Colors.blue, fontSize: 14
        //               ),),
        //               SizedBox(width: 10,),
        //               Text("Blog",style: TextStyle(
        //                   color: Colors.blue, fontSize: 14
        //               ),),
        //               SizedBox(width: 10,),
        //               Text("Verification",style: TextStyle(
        //                   color: Colors.blue, fontSize: 14
        //               ),),
        //               SizedBox(width: 10,),
        //               Text("More",style: TextStyle(
        //                   color: Colors.blue, fontSize: 14
        //               ),),
        //
        //             ],),
        //           SizedBox(height: 2,),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
  loginfun() async {
    isLoading = true;
    setState(() {});
   // SharedPreferences preferences = await SharedPreferences.getInstance();
    var headers = {
      'Cookie':
      '_us=1662765015; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; PHPSESSID=f9bb8e6ac6beab30ca26a90c68848b5c; _us=1662751389; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse(StaticInfo.baseUrl));
    request.fields.addAll({
      'type': 'user_login',
      'username': emailController.text,
      'password': passwordController.text,
      's': DateTime.now().toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var newError;
      if (body['errors'] != null) {
        errorText = body['errors'];
        newError = errorText['error_text'];
        Fluttertoast.showToast(msg: "$newError");
        print("i am Error text $newError");
        setState(() {
          isLoading = false;
        });
      } else {

       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(),));
        var newMessage;
        message = body['messages'];
        newMessage = message['respond_message_1'];
       StaticInfo.userIdLogin = body['user_id'];
        print("i am user id After Login ${StaticInfo.userIdLogin}");
      //  preferences.setBool('isLoggedIn', true);
       // preferences.setString('email', emailController.text);
       // preferences.setString('password', passwordController.text);
        print("i am new message $newMessage");
        Fluttertoast.showToast(msg: "$newMessage");
        print("Successfully Login");
        setState(() {
          isLoading = false;
        });


      }
      ;
    }
    else {
      print(response.reasonPhrase);
      Fluttertoast.showToast(msg: "Something went wrong try again letter");
      print("api not working");
      setState(() {
        isLoading = false;
      });
    }
  }
}
