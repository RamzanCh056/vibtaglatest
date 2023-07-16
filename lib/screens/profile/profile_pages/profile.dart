import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import '../../../utils/constant.dart';
import '../drawer.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController eyeController = TextEditingController();
  TextEditingController hairController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController childrenController = TextEditingController();
  TextEditingController petsController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController ethnicityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool isRemembered = true;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height =
        deviceHeight(context: context) + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: TextStyle(color:Colors.white),),),
      body: Scaffold(
        body: SingleChildScrollView(

          child: Column(children: [
            Container(
              padding: spacing(
                horizontal: 19,
                vertical: 27,
              ),
              child: Column(

                children: [

                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Company'),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: height * 0.05,
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: userNameController,
                              decoration: InputDecoration(
                                hintText: 'Company name',
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: lightblue,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  top: 0,
                                  left: 10,
                                  bottom: 0,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: lightGrayNew,
                                  ),
                                  borderRadius: borderRadius(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Phone'),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: height * 0.05,
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Phone number',
                                contentPadding: const EdgeInsets.only(
                                  top: 0,
                                  left: 10,
                                  bottom: 0,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: lightblue,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: lightGrayNew,
                                  ),
                                  borderRadius: borderRadius(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Location'),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: height * 0.05,
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'location',
                                contentPadding: const EdgeInsets.only(
                                  top: 0,
                                  left: 10,
                                  bottom: 0,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: lightblue,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: lightGrayNew,
                                  ),
                                  borderRadius: borderRadius(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Website'),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: height * 0.05,
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'website',
                                contentPadding: const EdgeInsets.only(
                                  top: 0,
                                  left: 10,
                                  bottom: 0,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: lightblue,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: lightGrayNew,
                                  ),
                                  borderRadius: borderRadius(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('About'),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: height * 0.05,
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(

                                hintText: 'About',
                                contentPadding: const EdgeInsets.only(
                                  top: 0,
                                  left: 10,
                                  bottom: 0,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: lightblue,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: lightGrayNew,
                                  ),
                                  borderRadius: borderRadius(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),




                  const SizedBox(
                    height: 45,
                  ),
                  isLoading
                      ? loadingSpinner()
                      : InkWell(
                    onTap: () {
                      //registerUser();
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
                                'Save',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 12,
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
                    height: 18,
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




          ],),
        ),
      ),

    );

  }

}
