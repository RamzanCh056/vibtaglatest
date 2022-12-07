import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vibetag/res/static_info.dart';
import 'package:vibetag/screens/auth/login.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:http/http.dart'as http;
import '../../utils/constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var message;
  var errorText;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(

      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(

            child: Column(
              children: [
                Column(
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
                      height: height * 0.65,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                }
                            ),
                          ),
                          const SizedBox(
                            height: 40,
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
                          GestureDetector(
                            onTap: (){
                              if (formKey.currentState!.validate()) {
                                recoverPassword();
                              }
                            },
                            child: Container(
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
                                    screen: Login(),
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
                                    screen: Login(),
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
      ),
    );
  }
  recoverPassword() async{
    isLoading = true;
    setState(() {});
    var headers = {
      'Cookie': 'PHPSESSID=e7add58683ede1682a95df88c962ef5e; _us=1662922660; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-10%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse(StaticInfo.baseUrl));
    request.fields.addAll({
      'type': 'reset_pass',
      'email':  email.text,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
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

        message = body['api_text'];
        print("i am message $message");
        Fluttertoast.showToast(msg: "$message send check email");
        print("Successfully send");
        setState(() {
          isLoading = false;
        });
      }

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
