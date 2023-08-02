import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

import '../../register/reusabletext.dart';

class PageGeneralSetting extends StatefulWidget {
  const PageGeneralSetting({Key? key}) : super(key: key);

  @override
  State<PageGeneralSetting> createState() => _PageGeneralSettingState();
}

class _PageGeneralSettingState extends State<PageGeneralSetting> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Color(0xff000000),
                      ),
                    ),
                    Spacer(),
                    ReusableText(
                      title: 'General Settings',
                      size: 16,
                      weight: FontWeight.w700,
                      color: Color(0xff363D4C),
                    ),
                    Spacer(),
                    Container(
                      width: 56,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xffFDBA31),
                            Color(0xffFF9200),
                          ]),
                          borderRadius: BorderRadius.circular(26)),
                      child: Center(
                        child: ReusableText(
                          title: 'Save',
                          size: 14,
                          weight: FontWeight.w700,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 190,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("Asset/images/setting/B1.png")),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: -60,
                      left: 0,
                      child:
                          Image(image: AssetImage("Asset/images/setting/B1S.png")),
                    ),
                    Positioned(
                      right: 10,
                      top: 15,
                      child: DottedBorder(
                        color: Color(0xffC8D1E5),
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            width: 120,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xffC8D1E5).withOpacity(0.6)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_rounded,
                                  color: Color(0xffFFFFFF),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ReusableText(
                                  title: 'Upload Cover',
                                  size: 10,
                                  weight: FontWeight.w600,
                                  color: Color(0xffFFFFFF),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 150,
                        right: 147,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF1F4FB)),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Color(0xff99A7C7),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      title: 'Page name',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "Foxit Technology",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Category',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xff99A7C7),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "Select",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Page URL',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: EdgeInsets.only(left: 3),
                            height: 53,
                            width: 142,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF8F9FB)),
                            child: Center(
                              child: ReusableText(
                                title: 'Vibetag.com/',
                                size: 16,
                                weight: FontWeight.w500,
                                color: Color(0xff7D8CAC),
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "  Foxit Technology",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 2,
                      height: 2,
                      color: Color(0xffE6EAF3),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ReusableText(
                          title: 'Location',
                          size: 16,
                          weight: FontWeight.w700,
                          color: Color(0xff212121),
                        ),
                        Spacer(),
                        Container(
                          width: 101,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffC8D1E5)),
                              color: Color(0xffF1F4FB)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReusableText(
                                title: 'Public',
                                size: 12,
                                weight: FontWeight.w600,
                                color: Color(0xff485470),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Color(0xff99A7C7),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Address',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      maxLines: 3,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff99A7C7)),
                          hintText: "Street no. 2 Austin Road, nearby\nWin Garden",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'City/Town',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "Canada",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Postal Code',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "19060",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 2,
                      height: 2,
                      color: Color(0xffE6EAF3),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ReusableText(
                          title: 'Contact info',
                          size: 16,
                          weight: FontWeight.w700,
                          color: Color(0xff212121),
                        ),
                        Spacer(),
                        Container(
                          width: 101,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffC8D1E5)),
                              color: Color(0xffF1F4FB)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReusableText(
                                title: 'Public',
                                size: 12,
                                weight: FontWeight.w600,
                                color: Color(0xff485470),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Color(0xff99A7C7),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Phone Number',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "+9444519060",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Email',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "Even6767@gmail.com",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Website Link',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff99A7C7)),
                          hintText: "Website Address",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xffC8D1E5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffC8D1E5)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 2,
                      height: 2,
                      color: Color(0xffE6EAF3),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 52,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffC8D1E5),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFFFFF)),
                      child: Row(
                        children: [
                          ReusableText(
                            title: 'Allow Review on page',
                            size: 16,
                            weight: FontWeight.w600,
                            color: Color(0xff212121),
                          ),
                          Spacer(),
                          Switch(
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                            activeColor: Color(0xffFFFFFF), // Active color
                            activeTrackColor: Color(0xFFFFC007), // Head color
                            inactiveThumbColor: Color(0xFFFFFFFF), // Unactive color
                            inactiveTrackColor: Color(0xFF000000), // Border color
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
