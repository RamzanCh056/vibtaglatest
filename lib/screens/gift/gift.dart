import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';
import 'package:http/http.dart' as http;

class Gift extends StatefulWidget {
  const Gift({super.key});

  @override
  State<Gift> createState() => _GiftState();
}

class _GiftState extends State<Gift> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  var data =[];
  var message ;
  getGift()async{
    var headers = {
      'Cookie': 'PHPSESSID=288ebdafe331b5a837fde5bb40995888; _us=1671626884; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-20%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'gifts',
      'action': 'get_my_gifts',
      'user_id':
     // '34099'
     loginUserId.toString(),
      //my user id //34099
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      body.toString().contains('message') ?
      message = body['message']
          : data = body['data'];
      body.toString().contains('data') ?
      data = body['data']:
      message = body['message'];

      print(" data is $data");
      print(" message is $message");

    }
    else {
      print(response.reasonPhrase);
    }

  }
  void initState() {
    getGift();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const NavBar(),
                    Header(
                      onTap: () {
                        key.currentState!.openDrawer();
                      },
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.08,
                          width: width,
                          child: Card(
                            color: backgroundColor,
                            child: Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: spacing(
                                      horizontal: 0,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
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
                                                    borderRadius:
                                                        borderRadius(20),
                                                  ),
                                                  child: SvgIcon(
                                                    'assets/svg/post/ic_menu_gifters.svg',
                                                    width: width * 0.04,
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Gifts',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                ),
                                              )
                                            ],
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
                        const SizedBox(height: 10,),

                        FutureBuilder(
                            future: getGift(),
                            builder: (context,AsyncSnapshot snapshot) {
                              if ( snapshot.connectionState == ConnectionState.waiting) {
                                return
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  );

                              } else {
                                return
                                  message != "" && message !=null?  Center(child: Text(message.toString(), style: const TextStyle(fontSize: 22),)):
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount:
                                    data.length,//photoList.length,
                                    itemBuilder: (context, index) {
                                      return

                                        //message !=null && message ==""?  Text("${message.toString()}", style: const TextStyle(fontSize: 22),):
                                        Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 20),
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: Colors.grey.shade300,
                                                    backgroundImage: NetworkImage( data[index]['avatar']),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    data[index]['username'].toString(),
                                                    style: const TextStyle(
                                                        color: Colors.orange, fontWeight: FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),

                                                  const Text(
                                                    "Send you a",
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    "Gift",
                                                    style: TextStyle(fontWeight: FontWeight.w500),
                                                  ),
                                                  const Spacer(),
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.grey.shade300,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Image.network(  data[index]['media_file'], height: 140,),
                                            const Divider(color: Colors.grey,),
                                            Text(data[index]['text']),
                                          ],
                                        ),
                                      );

                                    });
                              }
                            }),

                        // Container(
                        //   padding: spacing(
                        //     horizontal: 10,
                        //     vertical: 12,
                        //   ),
                        //   margin: spacing(
                        //     horizontal: 15,
                        //     vertical: 10,
                        //   ),
                        //   decoration: BoxDecoration(
                        //       color: white,
                        //       borderRadius: borderRadius(
                        //         10,
                        //       )),
                        //   child: Column(
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           InkWell(
                        //             onTap: () {},
                        //             child: Row(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.center,
                        //               children: [
                        //                 Center(
                        //                   child: Container(
                        //                     width: width * 0.1,
                        //                     height: width * 0.1,
                        //                     decoration: BoxDecoration(
                        //                       borderRadius: borderRadius(20),
                        //                     ),
                        //                     child: CircleAvatar(
                        //                       backgroundColor: darkGray,
                        //                       radius: width * 0.05,
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 const SizedBox(
                        //                   width: 10,
                        //                 ),
                        //                 Container(
                        //                   width: width * 0.73,
                        //                   child: Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceBetween,
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.center,
                        //                     children: [
                        //                       Row(
                        //                         children: [
                        //                           Text(
                        //                             'Rphyne',
                        //                             style: TextStyle(
                        //                               fontSize: textSm,
                        //                               color: orange,
                        //                             ),
                        //                           ),
                        //                           const SizedBox(
                        //                             width: 5,
                        //                           ),
                        //                           Text(
                        //                             'Send you a Gift',
                        //                             style: TextStyle(
                        //                               fontSize: textSm,
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       Container(
                        //                         width: width * 0.07,
                        //                         height: width * 0.07,
                        //                         padding: spacing(
                        //                           horizontal: 5,
                        //                           vertical: 5,
                        //                         ),
                        //                         decoration: BoxDecoration(
                        //                           color: lightGray,
                        //                           borderRadius:
                        //                               borderRadius(width * 0.1),
                        //                         ),
                        //                         child: const Center(
                        //                           child: Icon(
                        //                             Icons.close,
                        //                             size: 20,
                        //                           ),
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       Container(
                        //         height: height * 0.2,
                        //         child: Image.asset(
                        //           'assets/images/gift.png',
                        //           width: width * 0.5,
                        //         ),
                        //       ),
                        //       Container(
                        //         width: double.maxFinite,
                        //         height: 1,
                        //         color: darkGray,
                        //       ),
                        //       const SizedBox(
                        //         height: 10,
                        //       ),
                        //       Container(
                        //         width: double.maxFinite,
                        //         child: const Text(
                        //           'Have a great day brother!',
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  getGift();
                                 // Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.keyboard_arrow_left_outlined,
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
                              Container(
                                height: height * 0.06,
                                width: width * 0.45,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: borderRadius(10),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Send Thanks',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SecondaryFooter(),
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
