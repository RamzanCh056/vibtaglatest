import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/static_info.dart';
import '../../utils/constant.dart';
import '../../widgets/input_field.dart';
import 'package:http/http.dart'as http;
import '../../widgets/select_field.dart';
import 'add_photo.dart';
import 'after_registration.dart';
var userNameSave = "";
var passwordSave= "";
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bdyTypeController = TextEditingController();
  final heightController = TextEditingController();
  final EthnicityController = TextEditingController();
  final eyeColorController = TextEditingController();
  final hairColorController = TextEditingController();
  final religionController = TextEditingController();
  final smokeController = TextEditingController();
  final childrenController = TextEditingController();
  final petsController = TextEditingController();
  final educationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool? isRemembered = false;
  var message;
  var errorText;
  bool isLoading = false;
  bool obc = true;
  bool obcConfirm = true;
  //int index = 1;
  int currentIndex = 1;
  int currentIndexHeight = 1;
  int currentIndexEyeColor= 1;
  int currentIndexHairColor= 1;
  int  currentIndexReligion=1;
  int  currentIndexSmoke =1;
  int currentIndexChildren =1;
  int  currentIndexPets =1;
  int  currentIndexEducation =1;
  int  currentIndexEthinicity =1;
  var userData;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return SingleChildScrollView(
      child:  Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              InputField(
                  title: 'User name',
                  hintText: 'Name Here',
                  controller:
                  userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                  }
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InputField(
                  title: 'E-mail Address',
                  hintText:
                  'someone@gmail.com',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                  controller:
                  passwordController,
                  isObscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                  }
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InputField(
                  title: 'Confirm Password',
                  hintText: '************',
                  controller:
                  confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                  }
              ),

              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  showDialogForBodyType();
                },
                child: InputField(
                    title: 'Body type',
                    hintText: 'Select',
                    controller: bdyTypeController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),

              GestureDetector(
                onTap: (){
                  showDialogForHeight();
                },
                child: InputField(
                    title: 'Height',
                    hintText: 'Select',
                    controller: heightController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),

              GestureDetector(
                onTap: (){
                  showDialogForEyeColor();
                },
                child: InputField(
                    title: 'Eye Color',
                    hintText: 'Select',
                    controller: eyeColorController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  showDialogHairColor();
                },
                child: InputField(
                    title: 'Hair Color',
                    hintText: 'Select',
                    controller: hairColorController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  showDialogForReligion();
                },
                child: InputField(
                    title: 'Religion',
                    hintText: 'Select',
                    controller: religionController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  showDialogForSmoke();
                },
                child: InputField(
                    title: 'Smoke',
                    hintText: 'Select',
                    controller: smokeController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  showDialogForChildren();
                },
                child: InputField(
                    title: 'With Children',
                    hintText: 'Select',
                    controller: childrenController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  showDialogForPets();
                },
                child: InputField(
                    title: 'pets',
                    hintText: 'Select',
                    controller: petsController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  showDialogForEducation();
                },
                child: InputField(
                    title: 'Education',
                    hintText: 'Select',
                    controller: educationController,
                    enable: false,
                    sufIcon: Icons.keyboard_arrow_down_sharp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                    }
                ),
              ),
              SizedBox(
                height: height * 0.02,
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
                    registerFunc();

                  }
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
                    const Text(
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
              // SizedBox(
              //   height: 40,
              // ),

            ],
          ),
        ),
      ),







          ////

    );
  }
  showDialogForBodyType() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, "Body type"),
            content: Container(
              height: 220,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 6,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[0]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                bdyTypeController.text = userData[0]['type'][index];
                                currentIndex=index+1;
                                print("i am current index $currentIndex");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),

          );
        });
  }
  showDialogForHeight() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, "Height"),
            content: Container(
              height: 500,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 25,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[1]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                heightController.text = userData[1]['type'][index];
                                currentIndexHeight=index+1;
                                print("i am current index $currentIndexHeight");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),

          );
        });
  }

  showDialogForEyeColor() {
    showDialog(
        context: context,
        builder: (ctx) {
          return  AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, "Eye Colour"),
            content: Container(
              height: 220,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 6,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[2]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                eyeColorController.text = userData[2]['type'][index];
                                currentIndexEyeColor=index+1;
                                print("i am current index $currentIndexEyeColor");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),

          );
        });
  }
  showDialogHairColor() {
    showDialog(
        context: context,
        builder: (ctx) {
          return  AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, "Hair Colour"),
            content: Container(
              height: 220,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 6,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[3]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                hairColorController.text = userData[3]['type'][index];
                                currentIndexHairColor=index+1;
                                print("i am current index $currentIndexHairColor");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),

          );
        });
  }

  showDialogForReligion() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Religion'),
            content:Container(
              height: 550,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 16,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[4]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                religionController.text = userData[4]['type'][index];
                                currentIndexReligion=index+1;
                                print("i am current index $currentIndexReligion");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }

  showDialogForSmoke() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Smoke'),
            content:Container(
              height: 120,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 3,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[5]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                smokeController.text = userData[5]['type'][index];
                                currentIndexSmoke=index+1;
                                print("i am current index $currentIndexSmoke");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }

  showDialogForChildren() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Children'),
            content:Container(
              height: 150,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 4,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[6]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                childrenController.text = userData[6]['type'][index];
                                currentIndexChildren=index+1;
                                print("i am current index $currentIndexChildren");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }

  showDialogForPets() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Pets'),
            content:Container(
              height: 180,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 4,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[7]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                petsController.text = userData[7]['type'][index];
                                currentIndexPets=index+1;
                                print("i am current index $currentIndexPets");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }

  showDialogForEducation() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Education'),
            content:Container(
              height: 290,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 8,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[8]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                educationController.text = userData[8]['type'][index];
                                currentIndexEducation=index+1;
                                print("i am current index $currentIndexEducation");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }

  showDialogForEthnicity() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Ethnicity'),
            content:Container(
              height: 380,
              child: FutureBuilder(
                  future: getRegistersDetails(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || userData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 10,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                    child: Text( userData[9]['type'][index]
                                    ),
                                  ),
                                  Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                EthnicityController.text = userData[9]['type'][index];
                                currentIndexEthinicity=index+1;
                                print("i am current index $currentIndexEthinicity");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }
  registerFunc() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userNameSave = userNameController.text;
    passwordSave= passwordController.text;
    print("i am current index body type in api = ${currentIndex.toString()}");
    print("i am current index height in api = ${currentIndexHeight.toString()}");
    print("i am current index Eye Color in api = ${currentIndexEyeColor.toString()}");
    print("i am current index Hair Color in api = ${currentIndexHairColor.toString()}");
    print("i am current index Religion in api = ${currentIndexReligion.toString()}");
    print("i am current index Smoke in api = ${currentIndexSmoke.toString()}");
    print("i am current index Children in api = ${currentIndexChildren.toString()}");
    print("i am current index Pets api = ${currentIndexPets.toString()}");
    print("i am current index Education api = ${currentIndexEducation.toString()}");
    print("i am current index Ethnicity api = ${currentIndexEthinicity.toString()}");
    isLoading = true;
    setState(() {});
    var headers = {
      'Cookie':
      '_us=1662751327; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; PHPSESSID=f9bb8e6ac6beab30ca26a90c68848b5c; access=1; mode=day'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(StaticInfo.baseUrl));
    request.fields.addAll({
      'type': 'user_registration',
      'email': emailController.text,
      'username': userNameController.text,
      'password': passwordController.text,
      'confirm_password': confirmPasswordController.text,
      'fid_1':   currentIndex.toString(),
      'fid_2': currentIndexHeight.toString(),
      'fid_3':currentIndexEyeColor.toString(),
      'fid_4': currentIndexHairColor.toString(),
      'fid_5':  currentIndexReligion.toString(),
      'fid_6':  currentIndexSmoke.toString(),
      'fid_7': currentIndexChildren.toString(),
      'fid_8':  currentIndexPets.toString(),
      'fid_9':  currentIndexEducation.toString(),
      'fid_10': currentIndexEthinicity.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
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
        pushReplacement(
          context: context,
          screen: AfterRegistration(),
        );
        preferences.setString('email', emailController.text);
        preferences.setString('password', passwordController.text);
        message = body['message'];

        print("i am message $message");
        Fluttertoast.showToast(msg: "$message");
        var Identity = body['user_id'];
        print("i am user id in  signup (Register Id is =) $Identity");
        print("Successfully Join");

        setState(() {
          isLoading = false;
        });
      }


    } else {
      print(response.reasonPhrase);
      Fluttertoast.showToast(msg: "Something went wrong try again letter");
      print("api not working");
      setState(() {
        isLoading = false;
      });
    }

  }

  getRegistersDetails()async{
    var headers = {
      'Cookie': 'PHPSESSID=4a9373de7ada0c68cce2cd914d4f93c5; _us=1663260947; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-14%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_registration_fields'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      userData = body['data'];

      print("i am data $userData");
      // return userData;

    }
    else {
      print(response.reasonPhrase);
      //return null;
    }

  }
}
