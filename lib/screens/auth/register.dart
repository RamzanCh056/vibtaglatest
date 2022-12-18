import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/auth/login.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/widgets/select_field.dart';

import '../../utils/constant.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    '5\'4\" (160cm)',
    '5\'5\" (163cm)',
    '5\'6\" (165cm)',
    '5\'7\" (168cm)',
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
  void registerUser() async {
    final data = {
      'type': 'user_registration',
      'email': emailController.text.trim().toString(),
      'username': userNameController.text.trim().toString(),
      'password': passowrdController.text.trim().toString(),
      'confirm_password': confirmPasswordController.text.trim().toString(),
      'fid_1': bodyItems.indexOf(bodyController.text).toString(),
      'fid_2': heightItems.indexOf(heightController.text).toString(),
      'fid_3': eyeItems.indexOf(eyeController.text).toString(),
      'fid_4': hairItems.indexOf(hairController.text).toString(),
      'fid_5': religionItems.indexOf(religionController.text).toString(),
      'fid_6': smokeItems.indexOf(smokeController.text).toString(),
      'fid_7': childrenItems.indexOf(childrenController.text).toString(),
      'fid_8': petItems.indexOf(petsController.text).toString(),
      'fid_9': educationItems.indexOf(educationController.text).toString(),
      'fid_10': ethnicityItems.indexOf(ethnicityController.text).toString(),
      'gender': genderController.text,
    };
    print(data);
    final result = await API().postData(data);
    final response = json.decode(result.body);
    if (response['api_text'] == 'success') {
      pushReplacement(
        context: context,
        screen: const Login(),
      );
    }
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
                padding: spacing(
                  horizontal: 19,
                  vertical: 27,
                ),
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
                          height: 56,
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: userNameController,
                                decoration: InputDecoration(
                                  hintText: 'e.g; @mark12',
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
                          height: 56,
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
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
                          child: const Text('Password'),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 56,
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: passowrdController,
                                decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle:
                                      TextStyle(fontSize: 16, color: lightblue),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: lightGrayNew,
                                    ),
                                    borderRadius: borderRadius(12),
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
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('Confirm Password'),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 56,
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle:
                                      TextStyle(fontSize: 16, color: lightblue),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: lightGrayNew,
                                    ),
                                    borderRadius: borderRadius(12),
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                          height: 56,
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
                              registerUser();
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
                                        'SIGN UP',
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
                              screen: const Login(),
                            );
                          },
                          child: Text(
                            ' Login',
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
