import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:dotted_border/dotted_border.dart';

class CreateFundingRequest extends StatefulWidget {
  const CreateFundingRequest({super.key});

  @override
  State<CreateFundingRequest> createState() => _CreateFundingRequestState();
}

class _CreateFundingRequestState extends State<CreateFundingRequest> {
  TextEditingController currency = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Padding(
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: borderRadius(15),
            boxShadow: [
              BoxShadow(
                offset: Offset.zero,
                color: Color.fromARGB(70, 0, 0, 0),
                blurRadius: 4,
                spreadRadius: 1,
              )
            ]),
        height: height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: spacing(horizontal: 10, vertical: 25),
                child: Text(
                  'Create a funding request',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: spacing(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: grayLight,
                  borderRadius: borderRadius(15),
                ),
                child: DottedBorder(
                  color: grayMed,
                  dashPattern: [8, 4],
                  strokeWidth: 2,
                  child: Container(
                    padding: spacing(vertical: 25),
                    height: height * 0.2,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Image-2.png'),
                              gap(w: 10),
                              Text(
                                'Tap to Upload Image',
                                style: TextStyle(
                                  color: grayMed,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          gap(h: 5),
                          Text(
                            'Select from computer or drag & drop the image',
                            style: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              gap(h: 30),
              Container(
                margin: spacing(
                  horizontal: 25,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Title',
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap(h: 5),
              Container(
                width: double.infinity,
                margin: spacing(
                  horizontal: 15,
                ),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter here',
                      hintStyle: TextStyle(
                        color: grayMed,
                      ),
                      contentPadding: spacing(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: grayMed,
                        ),
                        borderRadius: borderRadius(15),
                      ),
                    ),
                  ),
                ),
              ),
              gap(h: 15),
              Container(
                margin: spacing(
                  horizontal: 25,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'How much money you would like to receive?',
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap(h: 5),
              Container(
                width: double.infinity,
                margin: spacing(
                  horizontal: 15,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter here',
                          hintStyle: TextStyle(
                            color: grayMed,
                          ),
                          contentPadding: spacing(
                            vertical: 5,
                            horizontal: 15,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: grayMed,
                            ),
                            borderRadius: borderRadius(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Container(
                        width: width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 2,
                              height: 40,
                              color: grayMed,
                            ),
                            Container(
                              width: width * 0.2,
                              child: DropDownList(
                                bgColor: white,
                                textColor: grayMed,
                                items: ['Dollar', 'PKR', 'Pound'],
                                controller: currency,
                                first: 'Dollar',
                                fieldHeight: 0.05,
                                isUnderline: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              gap(h: 15),
              Container(
                margin: spacing(
                  horizontal: 25,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap(h: 5),
              Container(
                width: double.infinity,
                margin: spacing(
                  horizontal: 15,
                ),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter here',
                      hintStyle: TextStyle(
                        color: grayMed,
                      ),
                      contentPadding: spacing(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: grayMed,
                        ),
                        borderRadius: borderRadius(15),
                      ),
                    ),
                    maxLines: 8,
                  ),
                ),
              ),
              gap(h: 15),
              Container(
                margin: spacing(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: spacing(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: grayLight,
                        borderRadius: borderRadius(10),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: grayPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: spacing(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            HexColor('#FF9200'),
                            HexColor('#FDBA31'),
                          ],
                        ),
                        borderRadius: borderRadius(10),
                      ),
                      child: Text(
                        'Send Now',
                        style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              gap(h: 10)
            ],
          ),
        ),
      ),
    );
  }
}
