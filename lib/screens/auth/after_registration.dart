import 'dart:convert';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/controller/login_controller.dart';
import 'package:vibetag/res/static_info.dart';
import 'package:vibetag/screens/auth/login_screen.dart';
import 'package:vibetag/screens/auth/singnup_screen.dart';
import '../../utils/constant.dart';
import '../../widgets/header.dart';
import '../../widgets/navbar.dart';
import 'login.dart';

// var userList;
late SharedPreferences preferences;

class AfterRegistration extends StatefulWidget {
  const AfterRegistration({Key? key}) : super(key: key);

  @override
  State<AfterRegistration> createState() => _AfterRegistrationState();
}

class _AfterRegistrationState extends State<AfterRegistration> {
  File? imageFile;
  String image =
      "data:image/jpeg;base64,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";
  int currentStep = 0;
  var message;
  var errorText;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController birthDay = TextEditingController();
  TextEditingController countryPicker = TextEditingController();
  String countrypick = "";

  DateTime? birthDate;
  var getData = [];
  var list;

  getList() async {

    print("user id login is ${ preferences.getString('LoginId').toString()}");
    var headers = {
      'Cookie':
      'PHPSESSID=0e4ace862d7d6aff6abd0553d5624e17; _us=1663425770; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-16%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_startup_users',
      'user_id':  preferences.getString('LoginId').toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var  body = jsonDecode(res);
      getData =  body['data'];
      list =  getData[0];
      print("data == $getData");
      print("list == $list");
    } else {
      print(response.reasonPhrase);
    }
  }
  LoginController controller = Get.put(LoginController());
  // AuthController controller = Get.put(AuthController());
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {
      });
    });
    controller.loginfun();
    getList();
    super.initState();
  }

  //ImagePicker imageFile = ImagePicker();
  selectDate(BuildContext context, int index) async {
    DateTime? selectDate;
    await DatePicker.showDatePicker(context,
        showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
          selectDate = date;
        }, currentTime: DateTime.now());
    if (selectDate != null) {
      setState(() {
        if (index == 0) {
          birthDay.text = DateFormat('dd/MM/yyyy').format(selectDate!);
          birthDate = selectDate;
        }
      });
    }
  }



  infoUpdate() async {
    print("i am user id ${StaticInfo.userId}");
    print("i am first name ${firstName.text}");
    print("i am Last Name ${LastName.text}");
    print("i am BirthDay ${birthDay.text}");
    print("i am Country ${countryPicker.text}");

    var headers = {
      'Cookie':
      'PHPSESSID=0e4ace862d7d6aff6abd0553d5624e17; _us=1663423655; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-16%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'update_user_information_startup',
      'user_id': StaticInfo.userId,
      'first_name': firstName.text,
      'last_name': LastName.text,
      'birthday': birthDay.text,
      'country': countryPicker.text,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var newBody = body['message'];
      Fluttertoast.showToast(msg: "$newBody");
    } else {
      print(response.reasonPhrase);
    }
  }

  avatarPic() async {
    print("i am static info ${StaticInfo.userId.toString()}");
    var headers = {
      'Cookie':
      'PHPSESSID=0e4ace862d7d6aff6abd0553d5624e17; _us=1663419216; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-16%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'update_user_avatar_picture',
      'user_id': StaticInfo.userId.toString(),
    });
    request.files
        .add(await http.MultipartFile.fromPath('avatar', imageFile!.path));
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
      } else {
        Fluttertoast.showToast(msg: "Successfully Upload");
        print("Successfully Upload");
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      //imageQuality: 30,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(children: [

        const SizedBox(height: 25,),
        Column(
          children: [
            const NavBar(),
            Header(
              onTap: () {
                print("vlivk");
                getList();
              },
            ),
          ],
        ),
        Expanded(

          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (currentStep == 0) {
                if (imageFile != null) {
                  avatarPic();
                  print('first step');
                  setState(() {
                    currentStep += 1;
                  });
                } else {
                  Fluttertoast.showToast(msg: "Please Add photo");
                  // print("pic la puter");
                }
              } else if (currentStep == 1) {
                if (formKey.currentState!.validate()) {
                  infoUpdate();
                  setState(() {
                    currentStep += 1;
                  });
                } else {
                  Fluttertoast.showToast(msg: "Enter all fields");
                  print('Step two');
                }
              } else if (isLastStep) {
                print('step complete');
                Fluttertoast.showToast(msg: "Successfully register please login");
                Get.to( Login ());
              }
              // else {
              //   setState(() {
              //     currentStep = 1;
              //   });
              // }
            },
            onStepCancel:
            currentStep == 0 ? null : () => setState(() => currentStep -= 1),
          ),
        ),
      ],),


    );
  }

  List<Step> getSteps() => [
    Step(
        isActive: currentStep >= 0,
        title: Text('Media'),
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Add a photo',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Show your  unique personality and style',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () {
                  getFromCamera();
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: (imageFile != null)
                            ? FileImage(imageFile!) as ImageProvider
                            : const NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4e2w7sqLN7wNvah3rnc3RbSILIsG7Bfdwa7haC-mEzRmj8bqeseg0241dzcF1W4yGkoU&usqp=CAU",
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        )),
    Step(
        isActive: currentStep >= 1,
        title: const Text('Info'),
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Tell us about yourself',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Share your information with our community.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("First name",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: firstName,
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Stephen',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(16.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(16.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text("Last name",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: LastName,
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'David',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(16.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(16.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text("Country",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                //Optional. Sets the border radius for the bottomsheet.
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                //Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              // exclude: <String>['KN', 'MF'],
                              onSelect: (Country country) {
                                //  countrypick = country.name;
                                countryPicker.text = country.name;
                                countrypick = country.name;
                                print('Select country: ${country.name}');
                              });
                        },
                        child: TextFormField(
                          controller: countryPicker,
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            filled: true,
                            enabled: false,
                            fillColor: Colors.white,
                            hintText: 'United State',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Birthday",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());

                          selectDate(context, 0);
                        },
                        child: TextFormField(
                          controller: birthDay,
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            filled: true,
                            enabled: false,
                            fillColor: Colors.white,
                            hintText: 'Select',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        )),
    Step(
        isActive: currentStep >= 2,
        title: Text('Follow'),
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Follow our famous users',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Get latest activities from our popular users.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              FutureBuilder(
                  future: getList(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null || getData != null) {
                      return   Container(
                        width:  300,
                        height:  320,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            0.8
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            double width = deviceWidth(context: context);
                            double height = deviceHeight(context: context);
                            return Container(
                              width: width * 0.6,
                              alignment: Alignment.topCenter,
                              color: HexColor('#F9F9F9'),
                              margin: EdgeInsets.symmetric(
                                horizontal: width * 0.02,
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      width: width * 0.6,
                                      height: height * 0.4,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                          width * 0.01,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      width: width * 0.6,
                                      height: height * 0.1,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(
                                            width * 0.03,
                                          ),
                                          topRight: Radius.circular(
                                            width * 0.03,
                                          ),
                                        ),
                                        child: Image.network(
                                          getData[index]['cover'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: height * 0.01,
                                    right: width * 0.02,
                                    child: Container(
                                      width: width * 0.05,
                                      height: width * 0.05,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                          width * 0.01,
                                        ),
                                        child: Image.asset(
                                          'assets/images/flag.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: height * 0.045,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      width: width * 0.2,
                                      height: width * 0.2,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                          width * 0.01,
                                        ),
                                        child:  CircleAvatar(
                                          foregroundImage: NetworkImage(
                                            getData[index]['avatar'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 115,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      width: width * 0.25,
                                      child: Column(
                                        children:  [
                                          Text(
                                            getData[index]['username'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            getData[index]['email'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Pakistan',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 128, 126, 126),
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 80,
                                    child: Container(
                                      width: width * 0.6,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                width * 0.01,
                                              ),
                                              color:
                                              HexColor('#F0F0F0'),
                                            ),
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal:
                                                width * 0.01,
                                                vertical: height *
                                                    0.005),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Likes',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color
                                                        .fromARGB(
                                                        255,
                                                        128,
                                                        126,
                                                        126),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                  height * 0.002,
                                                ),
                                                Container(
                                                  width: width * 0.15,
                                                  height:
                                                  height * 0.002,
                                                  color:
                                                  Color.fromARGB(
                                                      255,
                                                      173,
                                                      170,
                                                      170),
                                                ),
                                                SizedBox(
                                                  height:
                                                  height * 0.002,
                                                ),
                                                Text(
                                                  getData[index]['total_likes'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                    Colors.orange,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                width * 0.01,
                                              ),
                                              color:
                                              HexColor('#F0F0F0'),
                                            ),
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal:
                                                width * 0.01,
                                                vertical: height *
                                                    0.005),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Following',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color
                                                        .fromARGB(
                                                        255,
                                                        128,
                                                        126,
                                                        126),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                  height * 0.002,
                                                ),
                                                Container(
                                                  width: width * 0.15,
                                                  height:
                                                  height * 0.002,
                                                  color:
                                                  Color.fromARGB(
                                                      255,
                                                      173,
                                                      170,
                                                      170),
                                                ),
                                                SizedBox(
                                                  height:
                                                  height * 0.002,
                                                ),
                                                Text(
                                                  getData[index]['total_likes'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                    Colors.orange,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.17,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                width * 0.01,
                                              ),
                                              color:
                                              HexColor('#F0F0F0'),
                                            ),
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal:
                                                width * 0.01,
                                                vertical: height *
                                                    0.005),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Followers',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color
                                                        .fromARGB(
                                                        255,
                                                        128,
                                                        126,
                                                        126),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                  height * 0.002,
                                                ),
                                                Container(
                                                  width: width * 0.15,
                                                  height:
                                                  height * 0.002,
                                                  color:
                                                  Color.fromARGB(
                                                      255,
                                                      173,
                                                      170,
                                                      170),
                                                ),
                                                SizedBox(
                                                  height:
                                                  height * 0.002,
                                                ),
                                                Text(
                                                  getData[index]['total_likes'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                    Colors.orange,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 30,
                                    right: 30,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: width * 0.3,
                                      height: height * 0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                        BorderRadius.circular(
                                          width * 0.03,
                                        ),
                                      ),
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        )),
  ];
}
