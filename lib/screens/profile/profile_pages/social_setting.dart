import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../utils/constant.dart';

class SocialSettings extends StatefulWidget {
  const SocialSettings({Key? key}) : super(key: key);

  @override
  State<SocialSettings> createState() => _SocialSettingsState();
}

class _SocialSettingsState extends State<SocialSettings> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();

  bool isRemembered = true;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height =
        deviceHeight(context: context) + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(title: Text("Social", style: TextStyle(color:Colors.white),),),
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
                        child: const Text('Facebook'),
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
                                hintText: 'Facebook',
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
                        child: const Text('Twiter'),
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
                                hintText: 'Twiter',
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
                        child: const Text('Instagram'),
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
                                hintText: 'instagram',
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
                        child: const Text('Discord'),
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
                                hintText: 'Discord',
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
                        child: const Text('Linkedin'),
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
                                hintText: 'Linkedin',
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
                        child: const Text('YouTube'),
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
                                hintText: 'YouTube',
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
