import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
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
                                Container(
                                  width: width * 0.6,
                                  height: width * 0.6,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(
                                      width * 0.5,
                                    ),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 153, 150, 150),
                                      width: width * 0.01,
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
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
                                      const Text(
                                        'Skip',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
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
                                          )),
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
                                SelectCountry(
                                  title: 'Country',
                                  items: ['Select', 'Pakistan', "UAE"],
                                  controller: countryName,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                DateTimePicterField(),
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
                                      const Text(
                                        'Skip',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.02,
                                          vertical: height * 0.01,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(
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
                                  child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
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
                                                  child: Image.asset(
                                                    'assets/images/cover.jpg',
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
                                                  child: const CircleAvatar(
                                                    foregroundImage: AssetImage(
                                                      'assets/images/streamer.jpg',
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
                                                  children: const [
                                                    Text(
                                                      'Justin Wilson',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      '@justinwilson',
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
                                                          const Text(
                                                            '13K',
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
                                                          const Text(
                                                            '28',
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
                                                          const Text(
                                                            '8K',
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
                                      const Text(
                                        'Skip',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pushReplacement(
                                            context: context,
                                            screen: Home(),
                                          );
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
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
