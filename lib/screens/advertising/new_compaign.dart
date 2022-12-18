import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/advertising/new_compaign_details.dart';
import 'package:vibetag/screens/advertising/new_textField.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/widgets/date_time.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/secondary_footer.dart';
import 'package:vibetag/widgets/select_field.dart';
import '../../utils/constant.dart';

class CreateNewCompaign extends StatefulWidget {
  CreateNewCompaign({super.key});

  @override
  State<CreateNewCompaign> createState() => _CreateNewCompaignState();
}

class _CreateNewCompaignState extends State<CreateNewCompaign> {
  final TextEditingController companyName = TextEditingController();

  int pageIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width * 0.9,
              child: Card(
                elevation: 5,
                shadowColor: Color.fromARGB(71, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.07,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Center(
                                child: Container(
                                  padding: spacing(
                                    horizontal: 4,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: orange,
                                    borderRadius: borderRadius(
                                      width * 0.1,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Add preview',
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 1,
                          color: darkGray,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.08,
                          width: double.maxFinite,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: lightGray,
                              radius: width * 0.07,
                              child: Icon(
                                Icons.person,
                                color: darkGray,
                              ),
                            ),
                            title: const Text('Company'),
                            subtitle: const Text('Location'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: height * 0.15,
                          padding: spacing(
                            horizontal: 15,
                            vertical: 0,
                          ),
                          child: Text(
                            'Description',
                            style: TextStyle(
                              color: primaryGray,
                              fontSize: textSm,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            color: darkGray,
                          ),
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 15,
                            vertical: 0,
                          ),
                          width: double.maxFinite,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Title',
                              contentPadding: const EdgeInsets.only(
                                top: 4,
                              ),
                              prefix: const Icon(
                                Icons.text_fields_outlined,
                              ),
                              hintStyle: TextStyle(
                                color: accent,
                                fontSize: 20,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: height * 0.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                HexColor('#DDDDDD'),
                                white,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              height: height * 0.8,
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
                                        color:
                                            Color.fromARGB(255, 122, 122, 122),
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
                                        color:
                                            Color.fromARGB(255, 122, 122, 122),
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
                                        'Media file',
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
                                        'Details',
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
                                        'Targeting',
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
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width * 0.9,
                        child: Card(
                          elevation: 5,
                          shadowColor: Color.fromARGB(71, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.07,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Center(
                                        child: Container(
                                          child: SvgIcon(
                                            'assets/svg/post/image.svg',
                                            width: width * 0.05,
                                            color: orange,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Media',
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: 1,
                                  color: darkGray,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                  child: Text(
                                    'Your current wallet balance is :0, please top up your wallet to continue.',
                                    style: TextStyle(
                                      color: orange,
                                      fontSize: textSm,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.maxFinite,
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                  child: Text(
                                    'Top up',
                                    style: TextStyle(
                                      color: darkGray,
                                      fontSize: textSm,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                  child: InputField(
                                    title: 'Company name',
                                    hintText: 'Name here',
                                    controller: companyName,
                                    textColor: '#000000',
                                    background: '#EFEFEF',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.maxFinite,
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                  child: Text(
                                    'Image / Video',
                                    style: TextStyle(
                                      fontSize: textMed,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                  child: Text(
                                    'Select a image for your compaign',
                                    style: TextStyle(
                                      fontSize: textXSm,
                                      color: darkGray,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        HexColor('#DDDDDD'),
                                        white,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 10,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          child: Text(
                                            'Select Photo & Videos',
                                            style: TextStyle(
                                              color: white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 30,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          child: Icon(
                                            Icons.photo,
                                            size: 50,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: PageScroller,
                        child: Container(
                          width: width * 0.35,
                          padding: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: borderRadius(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: white,
                              fontSize: textSm,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  //Compaign Details
                  SingleChildScrollView(
                    child: Column(
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
                                  color: blue,
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
                                        child: Icon(
                                          Icons.check_circle,
                                          color: blue,
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
                                        child: Icon(
                                          Icons.check_circle,
                                          color: blue,
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
                                          'Media file',
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
                                        child: Text(
                                          'Details',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: blue,
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
                                          'Targeting',
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.9,
                          child: Card(
                            elevation: 5,
                            shadowColor: Color.fromARGB(71, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.07,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        Center(
                                          child: Container(
                                            width: width * 0.07,
                                            height: width * 0.07,
                                            padding: spacing(
                                              horizontal: 5,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius: borderRadius(20),
                                            ),
                                            child: SvgIcon(
                                              'assets/svg/post/info.svg',
                                              width: width * 0.04,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Details',
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    height: 1,
                                    color: darkGray,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: InputField(
                                      title: 'Compaign title',
                                      hintText: 'Title here',
                                      controller: companyName,
                                      textColor: '#000000',
                                      background: '#EFEFEF',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: InputField(
                                      title: 'Compaign Description',
                                      hintText: '',
                                      controller: companyName,
                                      textColor: '#000000',
                                      background: '#EFEFEF',
                                      maxLine: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Text(
                                      'Tell users what your compaign is about',
                                      style: TextStyle(
                                        fontSize: textXSm,
                                        color: darkGray,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    width: double.maxFinite,
                                    child: DateTimePicterField(
                                      title: 'Start Date',
                                      borderRadius: 15,
                                      hintText: 'Start date',
                                      allowborder: false,
                                      fontSize: 22,
                                      color: lightGray,
                                      padding: 15,
                                      selectedDate: '',
                                      onConfirm: (data) {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Text(
                                      'Select the compaign starting date, UTC',
                                      style: TextStyle(
                                        fontSize: textXSm,
                                        color: darkGray,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    width: double.maxFinite,
                                    child: DateTimePicterField(
                                      title: 'End Date',
                                      borderRadius: 15,
                                      hintText: 'End date',
                                      allowborder: false,
                                      fontSize: 22,
                                      color: lightGray,
                                      padding: 15,
                                      selectedDate: '',
                                      onConfirm: (data) {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Text(
                                      'Select the compaign ending date, UTC',
                                      style: TextStyle(
                                        fontSize: textXSm,
                                        color: darkGray,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: InputField(
                                      title: 'Website URL',
                                      hintText: 'URL here',
                                      controller: companyName,
                                      textColor: '#000000',
                                      background: '#EFEFEF',
                                      maxLine: 1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Text(
                                      'Choose Custom Image',
                                      style: TextStyle(
                                        fontSize: textMed,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    height: height * 0.2,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          HexColor('#DDDDDD'),
                                          white,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 10,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            child: Text(
                                              'Select Photo & Videos',
                                              style: TextStyle(
                                                color: white,
                                                fontSize: textMed,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 40,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            child: Icon(
                                              Icons.photo,
                                              size: 50,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Text(
                                      'My Page',
                                      style: TextStyle(
                                        fontSize: textMed,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.9,
                                    height: height * 0.08,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.72,
                                          decoration: BoxDecoration(
                                            color: lightGray,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                          ),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'Select',
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                left: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.1,
                                          decoration: BoxDecoration(
                                            color: lightGray,
                                          ),
                                          child: Table(
                                            children: [
                                              TableRow(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: darkGray,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                children: const [
                                                  TableCell(
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_up_outlined,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              TableRow(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: darkGray,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                children: const [
                                                  TableCell(
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Text(
                                      'Call to action',
                                      style: TextStyle(
                                        fontSize: textMed,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.9,
                                    height: height * 0.08,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.72,
                                          decoration: BoxDecoration(
                                            color: lightGray,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                          ),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'Select',
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                left: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.1,
                                          decoration: BoxDecoration(
                                            color: lightGray,
                                          ),
                                          child: Table(
                                            children: [
                                              TableRow(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: darkGray,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                children: const [
                                                  TableCell(
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_up_outlined,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              TableRow(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: darkGray,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                children: const [
                                                  TableCell(
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: width * 0.9,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_left_outlined,
                                                size: 32,
                                                color: blue,
                                              ),
                                              Text(
                                                'Go Back',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: PageScroller,
                                          child: Container(
                                            height: height * 0.06,
                                            width: width * 0.35,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: borderRadius(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Publish',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SecondaryFooter(),
                        AppFooter(),
                      ],
                    ),
                  ),
                  //Compaign Targeting
                  SingleChildScrollView(
                    child: Column(
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
                                  color: blue,
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
                                        child: Icon(
                                          Icons.check_circle,
                                          color: blue,
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
                                        child: Icon(
                                          Icons.check_circle,
                                          color: blue,
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
                                        child: Icon(
                                          Icons.check_circle,
                                          color: blue,
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
                                        child: Text(
                                          'Media file',
                                          style: TextStyle(
                                            color: blue,
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
                                        child: Text(
                                          'Details',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: blue,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            width * 0.1,
                                          ),
                                        ),
                                        child: Text(
                                          'Targeting',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: blue,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.9,
                          child: Card(
                            elevation: 5,
                            shadowColor: Color.fromARGB(71, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.07,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: width * 0.03,
                                          ),
                                          Center(
                                            child: Container(
                                              width: width * 0.07,
                                              height: width * 0.07,
                                              padding: spacing(
                                                horizontal: 5,
                                                vertical: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: orange,
                                                borderRadius: borderRadius(20),
                                              ),
                                              child: SvgIcon(
                                                'assets/svg/post/target.svg',
                                                width: width * 0.04,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            'Targeting',
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: 1,
                                      color: darkGray,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: InputField(
                                        title: 'Location',
                                        hintText: 'Location here',
                                        controller: companyName,
                                        textColor: '#000000',
                                        background: '#EFEFEF',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      width: double.maxFinite,
                                      child: Text(
                                        'Audience',
                                        style: TextStyle(
                                          fontSize: textSm,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius(10),
                                        color: lightGray,
                                      ),
                                      child: DropDownList(
                                        items: ['Nothing Selected'],
                                        controller: companyName,
                                        first: 'Nothing Selected',
                                        bgColor: lightGray,
                                        textColor: darkGray,
                                        padding: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: width * 0.9,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: DropOptionField(
                                        title: 'Gender',
                                        hinText: 'All',
                                        bgColor: lightGray,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: width * 0.9,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: DropOptionField(
                                        title: 'Placement',
                                        hinText: 'Post (Film Formate image)',
                                        bgColor: lightGray,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: width * 0.9,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: DropOptionField(
                                        title: 'Placement',
                                        hinText: 'Post (Film Formate image)',
                                        bgColor: lightGray,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      width: width * 0.8,
                                      alignment: Alignment.centerLeft,
                                      child: DateTimePicterField(
                                        title: 'Compaign Budget',
                                        borderRadius: 15,
                                        hintText: 'End date',
                                        allowborder: false,
                                        fontSize: textSm,
                                        color: lightGray,
                                        padding: 15,
                                        selectedDate: '',
                                        onConfirm: (data) {},
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: Text(
                                        'Enter the amount you want to spend on this compaign',
                                        style: TextStyle(
                                          fontSize: textXSm,
                                          color: darkGray,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: width * 0.9,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: DropOptionField(
                                        title: 'Didding',
                                        hinText: 'Pay per impression (\$0.2)',
                                        bgColor: lightGray,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: width * 0.9,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_left_outlined,
                                                  size: 32,
                                                  color: blue,
                                                ),
                                                Text(
                                                  'Go Back',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: PageScroller,
                                            child: Container(
                                              height: height * 0.06,
                                              width: width * 0.35,
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: borderRadius(10),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Publish',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SecondaryFooter(),
            AppFooter(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
