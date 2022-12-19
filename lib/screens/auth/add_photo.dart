import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:vibetag/screens/home/home.dart';
import 'package:vibetag/widgets/country.dart';
import 'package:vibetag/widgets/date_time.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_fields2.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController countryName = TextEditingController();
  TextEditingController bday = TextEditingController();
  TextEditingController country = TextEditingController();

  int pageIndex = 0;
  String selectedDate = '';
  bool isdateSelected = false;
  late Map<String, dynamic> countries;
  List<String> countryList = ['Select'];
  bool isloadedCountries = false;
  late List<dynamic> famouseUsers;
  bool isloadedFamousUsers = false;
  List<String> following = [];

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  void SaveInfo() async {
    final data = {
      'type': 'update_user_information_startup',
      'user_id': loginUserId.toString(),
      'first_name': fname.text.toString(),
      'last_name': lname.text.toString(),
      'birthday': selectedDate.toString(),
      'country': countryList.indexOf(countryName.text).toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    if (response['message'] == 'success') {
      ToastMessage(message: 'Your personal info saved successfully');

      PageScroller();
    }
  }

  void getCountries() async {
    final result = await API().postData(
      {'type': 'get_countries'},
    );
    countries = jsonDecode(result.body)['data'];
    for (int i = 0; i < countries.length; i++) {
      if (i > 0) {
        String country = countries['${i}'].toString();
        countryList.add(country);
      }
    }
    setState(() {
      isloadedCountries = true;
    });
    getFamousUsers();
  }

  void getFamousUsers() async {
    final data = {
      'type': 'get_startup_users',
      'user_id': loginUserId.toString(),
    };
    final result = await API().postData(data);
    famouseUsers = jsonDecode(result.body)['data'];
    setState(() {
      isloadedFamousUsers = true;
    });
  }

  bool isImageSelected = false;
  late String file = '';
  final PageController _pageController = PageController(initialPage: 0);
  void PageScroller() {
    if (pageIndex == 2) {
      setState(() {
        pageIndex = 0;
      });
    } else {
      setState(() {
        pageIndex++;
      });
    }
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInSine,
    );
  }

  late Uint8List? selectedImage;
  void selectImage() async {
    final image = await pickImage();
    if (image != null) {
      selectedImage = await image.readAsBytes();
      ToastMessage(message: 'Image selected successfully');

      file = image.path;
      print(file);
      setState(() {
        isImageSelected = true;
      });
    }
  }

  void uploadImage() async {
    if (file != '') {
      final result = await API().uploadImage(
        path: file,
        user_id: loginUserId,
      );
      if (jsonDecode(result)['status'] == 200) {
        ToastMessage(message: 'Image Uploaded successfully!');
        PageScroller();
      }
    }
  }

  void pushFollowing() async {
    String followingUsers = following.join(',');
    final data = {
      'type': 'follow_user_startup',
      'user_id': loginUserId,
      'user': followingUsers,
    };
    print(data);
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      await AuthMethod().setUser(
        context: context,
        userId: loginUserId,
      );
      ToastMessage(message: 'Success');

      pushReplacement(
        context: context,
        screen: const Home(),
      );
    }
  }

  String getInK(int number) {
    if (number < 1000) {
      return '${number}';
    }
    int followers = (number ~/ 1000);
    String getUserInK = '${followers}K';
    return getUserInK;
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  width: width,
                  height: height * 0.75,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _pageController.animateToPage(
                          pageIndex,
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInSine,
                        );
                      });
                    },
                    children: [
                      Column(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.08,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 14,
                                  child: Container(
                                    width: width,
                                    height: height * 0.003,
                                    color: Colors.black,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Positioned(
                                  top: 14,
                                  child: Container(
                                    color: Colors.blue,
                                    height: height * 0.003,
                                    width: width * 0.25,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Color.fromARGB(
                                                255, 122, 122, 122),
                                            size: 30,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Color.fromARGB(
                                                255, 122, 122, 122),
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 35,
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Media',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Info',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 153, 150, 150),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Follow',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 153, 150, 150),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            height: height * 0.6,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(width * 0.02)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                const Text(
                                  'Add a Photo',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Show your unique personality and style',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 110, 109, 109),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.06,
                                ),
                                InkWell(
                                  onTap: selectImage,
                                  child: Container(
                                    width: width * 0.6,
                                    height: width * 0.6,
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.circular(
                                        width * 0.5,
                                      ),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 153, 150, 150),
                                        width: width * 0.01,
                                      ),
                                    ),
                                    child: Center(
                                      child: isImageSelected
                                          ? CircleAvatar(
                                              foregroundImage:
                                                  MemoryImage(selectedImage!),
                                              radius: width * 0.3,
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                const Icon(
                                                  Icons.camera_alt,
                                                  size: 80,
                                                  color: Color.fromARGB(
                                                      255, 153, 150, 150),
                                                ),
                                                SizedBox(
                                                  height: height * 0.002,
                                                ),
                                                const Text(
                                                  'Upload Your Photo',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 153, 150, 150),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            PageScroller();
                                          });
                                        },
                                        child: const Text(
                                          'Skip',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          uploadImage();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                            vertical: height * 0.01,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                width * 0.02,
                                              )),
                                          child: const Text(
                                            'Save & Continue',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.08,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 14,
                                  child: Container(
                                    width: width,
                                    height: height * 0.003,
                                    color: Colors.black,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Positioned(
                                  top: 14,
                                  child: Container(
                                    color: Colors.blue,
                                    height: height * 0.003,
                                    width: width * 0.5,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Color.fromARGB(
                                                255, 122, 122, 122),
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 35,
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Media',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Info',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Follow',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 153, 150, 150),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            height: height * 0.6,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(width * 0.02)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                const Text(
                                  'Tell us about yourself',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Share your information with our community',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 110, 109, 109),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                InputField2(
                                  controller: fname,
                                  title: 'First name',
                                  hintText: 'Stephen',
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                InputField2(
                                  controller: lname,
                                  title: 'Last name',
                                  hintText: 'David',
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                isloadedCountries
                                    ? SelectCountry(
                                        title: 'Country',
                                        items: countryList,
                                        controller: countryName,
                                      )
                                    : Container(),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  width: width * 0.8,
                                  child: DateTimePicterField(
                                    padding: 6,
                                    hintText: 'Select',
                                    selectedDate: selectedDate,
                                    isSelected: isdateSelected,
                                    onConfirm: (date) {
                                      print('confirm $date');
                                      bday.text =
                                          DateFormat().add_yMd().format(date);

                                      //                       (date) {
                                      //   print('confirm $date');
                                      //   setState(() {
                                      //     formatedDate = DateFormat.yMMMMd().format(date);
                                      setState(() {
                                        isdateSelected = true;
                                        selectedDate = bday.text;
                                        // widget.selectedDate = formatedDate;
                                        // isSelected = true;
                                      });
                                      //   });
                                      // }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            PageScroller();
                                          });
                                        },
                                        child: const Text(
                                          'Skip',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          SaveInfo();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                            vertical: height * 0.01,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                width * 0.02,
                                              )),
                                          child: const Text(
                                            'Save & Continue',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.08,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 14,
                                  child: Container(
                                    width: width,
                                    height: height * 0.003,
                                    color: Colors.black,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Positioned(
                                  top: 14,
                                  child: Container(
                                    color: Colors.blue,
                                    height: height * 0.003,
                                    width: width,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 35,
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Media',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Info',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              width * 0.1,
                                            ),
                                          ),
                                          child: const Text(
                                            'Follow',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            height: height * 0.6,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width * 0.02),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                const Text(
                                  'Follow Our famous users',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.001,
                                ),
                                const Text(
                                  'Get latest activites from our popular users',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 110, 109, 109),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.9,
                                  height: height * 0.4,
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      width * 0.03,
                                    ),
                                  ),
                                  child: isloadedFamousUsers
                                      ? ListView.builder(
                                          itemCount: famouseUsers.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, i) {
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
                                                            BorderRadius
                                                                .circular(
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
                                                          topLeft:
                                                              Radius.circular(
                                                            width * 0.03,
                                                          ),
                                                          topRight:
                                                              Radius.circular(
                                                            width * 0.03,
                                                          ),
                                                        ),
                                                        child: Image.network(
                                                          famouseUsers[i]
                                                              ['cover'],
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
                                                            BorderRadius
                                                                .circular(
                                                          width * 0.01,
                                                        ),
                                                        child: Image.network(
                                                          famouseUsers[i]
                                                              ['flag'],
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
                                                            BorderRadius
                                                                .circular(
                                                          width * 0.01,
                                                        ),
                                                        child: Center(
                                                          child: CircleAvatar(
                                                            radius: width * 0.1,
                                                            foregroundImage:
                                                                NetworkImage(
                                                              famouseUsers[i]
                                                                  ['avatar'],
                                                              scale: 1.2,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: height * 0.16,
                                                    right: 0,
                                                    left: 0,
                                                    child: Container(
                                                      width: width * 0.25,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "${famouseUsers[i]['first_name']} ${famouseUsers[i]['last_name']}",
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            '@${famouseUsers[i]['username']}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            famouseUsers[i][
                                                                'country_name'],
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      128,
                                                                      126,
                                                                      126),
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                width * 0.01,
                                                              ),
                                                              color: HexColor(
                                                                  '#F0F0F0'),
                                                            ),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        width *
                                                                            0.01,
                                                                    vertical:
                                                                        height *
                                                                            0.005),
                                                            child: Column(
                                                              children: [
                                                                const FittedBox(
                                                                  child: Text(
                                                                    'Likes',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          128,
                                                                          126,
                                                                          126),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Container(
                                                                  width: width *
                                                                      0.15,
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          173,
                                                                          170,
                                                                          170),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Text(
                                                                  famouseUsers[
                                                                              i]
                                                                          [
                                                                          'total_likes_']
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                width * 0.01,
                                                              ),
                                                              color: HexColor(
                                                                  '#F0F0F0'),
                                                            ),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        width *
                                                                            0.01,
                                                                    vertical:
                                                                        height *
                                                                            0.005),
                                                            child: Column(
                                                              children: [
                                                                const FittedBox(
                                                                  child: Text(
                                                                    'Following',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          128,
                                                                          126,
                                                                          126),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Container(
                                                                  width: width *
                                                                      0.15,
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          173,
                                                                          170,
                                                                          170),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Text(
                                                                  famouseUsers[
                                                                              i]
                                                                          [
                                                                          'total_following_']
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .orange,
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
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                width * 0.01,
                                                              ),
                                                              color: HexColor(
                                                                  '#F0F0F0'),
                                                            ),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        width *
                                                                            0.01,
                                                                    vertical:
                                                                        height *
                                                                            0.005),
                                                            child: Column(
                                                              children: [
                                                                const FittedBox(
                                                                  child: Text(
                                                                    'Followers',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          128,
                                                                          126,
                                                                          126),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Container(
                                                                  width: width *
                                                                      0.15,
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          173,
                                                                          170,
                                                                          170),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Text(
                                                                  famouseUsers[
                                                                              i]
                                                                          [
                                                                          'total_followers_']
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .orange,
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
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (following.contains(
                                                            famouseUsers[i]
                                                                ['user_id'])) {
                                                          following.remove(
                                                              famouseUsers[i][
                                                                      'user_id']
                                                                  .toString());
                                                        } else {
                                                          following.add(
                                                              famouseUsers[i][
                                                                      'user_id']
                                                                  .toString());
                                                        }
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: width * 0.3,
                                                        height: height * 0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.orange,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            width * 0.03,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          following.contains(
                                                                  famouseUsers[
                                                                          i][
                                                                      'user_id'])
                                                              ? 'Following'
                                                              : 'Follow',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      : loadingSpinner(),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          pushReplacement(
                                            context: context,
                                            screen: Home(),
                                          );
                                        },
                                        child: const Text(
                                          'Skip',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pushFollowing();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                            vertical: height * 0.01,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                width * 0.02,
                                              )),
                                          child: const Text(
                                            'Finish',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
