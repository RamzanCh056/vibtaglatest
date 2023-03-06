import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/profile/personal_profile_drawer.dart';

import '../../utils/constant.dart';
import '../auth/input_field_new.dart';
import '../shop/drop_down_list.dart';
import 'drawer.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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

  List<String> bodyItems = const [
    'Select',
    'Thin',
    'Athletic',
    'Average',
    'Few Extra Pounds',
    'Curvy',
    'BBW'
  ];

  List<String> heightItems = const [
    'Select',
    '<5\'1\" (152cm)',
    '5\'2\" (155cm)',
    '5\'3\" (157cm)',
    '5\'4\" (120cm)',
    '5\'5\" (123cm)',
    '5\'6\" (125cm)',
    '5\'7\" (128cm)',
    '5\'8\" (170cm)',
    '5\'9\" (173cm)',
    '5\'10\" (175cm)',
    '5\'11\" (178cm)',
    '6\'0\" (180cm)',
    '6\'1\" (153cm)',
    '6\'2\" (185cm)',
    '6\'3\" (188cm)',
    '6\'4\" (191cm)',
    '6\'5\" (195cm)',
    '6\'6\" (198cm)',
    '6\'7\" (201cm)',
    '6\'8\" (203cm)',
    '6\'9\" (205cm)',
    '6\'10\" (208cm)',
    '6\'11\" (210cm)',
    '>7\'0\" (113cm)'
  ];

  List<String> eyeItems = const [
    'Select',
    'Brown',
    'Blue',
    'Gray',
    'Hazel',
    'Other'
  ];

  List<String> hairItems = const [
    'Select',
    'Black',
    'Blond(e)',
    'Brown',
    'Red',
    'Gray',
    'Bald',
  ];

  List<String> religionItems = const [
    'Select',
    'Non-Religious',
    'Anglican',
    'Baptist',
    'Buddhist',
    'Catholic',
    'Christian - Other',
    'Eastern Orthodox',
    'Hindu',
    'Jewish',
    'Lutheran',
    'Mehtodist',
    'Mormon',
    'Muslim',
    'Sikh',
    'Spiritual',
    'Presbyterian',
  ];

  List<String> smokeItems = const [
    'Select',
    'No',
    'Occasionally',
    'Often',
  ];

  List<String> childrenItems = const [
    'Select',
    'Prefer Not To Say',
    'Yes',
    'No',
    'Children Are Over 18',
  ];

  List<String> petItems = const [
    'Select',
    'No Pets',
    'Cat',
    'Dog',
    'Cat and Dog',
    'Birds',
    'OTher',
  ];

  List<String> ethnicityItems = const [
    'Select',
    'African American',
    'Asia',
    'Caucasian',
    'Indian',
    'Indigenous / Aboriginal',
    'Latin / Hispanic',
    'Middle Eastern',
    'Mixed',
    'Other',
  ];

  List<String> educationItems = const [
    'Select',
    'High School',
    'Some Collge',
    'Some University',
    'Associate\'s Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Graduate Degree',
    'PhD / Post Doctoral',
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height =
        deviceHeight(context: context) + MediaQuery.of(context).padding.top;
    return Scaffold(


     key: _scaffoldKey,
      drawer:  Menu(),
      appBar: AppBar(title: Text("Edit Profile"),),
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
                      child: const Text('Username'),
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
                              hintText: 'e.g; @mark12',
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
                      child: const Text('Email'),
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
                              hintText: 'Email Address',
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
                      child: const Text('Body Type'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: bodyItems,
                        controller: bodyController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Height'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: heightItems,
                        controller: heightController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Eye Color'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: eyeItems,
                        controller: eyeController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Hair Colors'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: hairItems,
                        controller: hairController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Religion'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: religionItems,
                        controller: religionController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Smoke'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: smokeItems,
                        controller: smokeController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('With Children'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: childrenItems,
                        controller: childrenController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Pets'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: petItems,
                        controller: petsController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Education'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: educationItems,
                        controller: educationController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Ethinicity'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: ethnicityItems,
                        controller: ethnicityController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Gender'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: height * 0.05,
                      padding: spacing(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightblue,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                      child: DropDownList(
                        items: const [
                          'Select',
                          'Male',
                          'Female',
                        ],
                        controller: genderController,
                        first: 'Select',
                        bgColor: Color.fromARGB(0, 255, 255, 255),
                        textColor: lightblue,
                        isUnderline: true,
                        fontSize: 12,
                        fieldHeight: 0.045,
                      ),
                    )
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
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.grey,
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
    );

  }

}
