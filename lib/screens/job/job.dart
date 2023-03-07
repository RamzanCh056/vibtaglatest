import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/album/all_albums.dart';
import 'package:vibetag/screens/album/create_album.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../drawer/shop_drawer.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../shop/shop_header.dart';
import 'package:http/http.dart' as http;

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  State<Job> createState() => _JobState();
}

class _JobState extends State<Job> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  TextEditingController search = TextEditingController();
  var jobs = [];
  String Url = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
  getJob()async{

    var headers = {
      'Cookie': 'PHPSESSID=de56e7493c31255f741b7134a874b256; _us=1676723040; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-02-17%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'jobs',
      'sub_type': 'get'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      jobs = body['data'];
      print("jobs == ${jobs}");
      setState(() {
        isLoading = false;

      });
    }
    else {
    print(response.reasonPhrase);
    setState(() {
      isLoading = false;

    });
    }

  }
  @override
  void initState() {
    super.initState();
    getJob();

  }
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: Column(
          children: [
            const NavBar(),
            Header(
            
            ),
            const SizedBox(
              height: 10,
            ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.grid_view_outlined,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "All Category",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFFE9700),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          isLoading?
          Center(child: CircularProgressIndicator()):
          Expanded(

            child: ListView.builder(
              itemCount: jobs.length,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration:  BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(
                                        Url+jobs[index]['image'],
                                      ),
                                        fit: BoxFit.cover
                                      ),
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        jobs[index]['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children:  [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            jobs[index]['location'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                               Text(

                                "Looking for ${jobs[index]['title']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                               ReadMoreText(
                                jobs[index]['description'],
                                trimLines: 2,
                                colorClickableText: Colors.black,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Read more',
                                trimExpandedText: 'Show less',
                                moreStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.28,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFF8F9FB),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Gender",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Not Specified",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.28,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFF8F9FB),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children:  [
                                        Text(
                                          "Type",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          jobs[index]['job_type'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.28,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFF8F9FB),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Openings",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Not Specified",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                   Text(
                                    "${jobs[index]['minimum']}-${jobs[index]['maximum']} \$",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                  const Text(
                                    "/month",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (_) {
                                            return const bottomSheet();
                                          });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 140,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFFFC107),
                                            Color(0xFFFF8205),
                                          ],
                                        ),
                                      ),
                                      child: const Text(
                                        "Apply Now",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                      ],
                    ),
                  );
                },



            ),
          ),

        
          ],
        ),
      ),
    );
  }
}
class bottomSheet extends StatefulWidget {
  const bottomSheet({Key? key}) : super(key: key);

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  bool fullTime = true;
  bool partTime = false;
  bool freelance = false;

  bool male = true;
  bool female = false;
  bool both = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.92,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Location",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0x15FF9200)),
                    child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFFFF9200),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "New Yourk, USA",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Company Type",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "New Yourk, USA",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Select price range",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "\$20-\$120",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF9200),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SfRangeSlider(
              values: const SfRangeValues(0.3, 0.7),
              onChanged: (SfRangeValues value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Job Type",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      fullTime = !fullTime;
                      partTime = false;
                      freelance = false;
                    });

                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: fullTime
                                ? const Color(0xFFFF9200)
                                : const Color(0xFFC8D1E5))),
                    child: Text(
                      "Full Time",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: fullTime ? const Color(0xFFFF9200) : const Color(0xFFC8D1E5),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      partTime = !partTime;
                      freelance = false;
                      fullTime = false;
                    });

                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: partTime
                                ? const Color(0xFFFF9200)
                                : const Color(0xFFC8D1E5))),
                    child: Text(
                      "Full Time",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: partTime ? const Color(0xFFFF9200) : const Color(0xFFC8D1E5),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      freelance = !freelance;
                      partTime = false;
                      fullTime = false;
                    });

                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: freelance
                                ? const Color(0xFFFF9200)
                                : const Color(0xFFC8D1E5))),
                    child: Text(
                      "Freelance",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: freelance ? const Color(0xFFFF9200) : const Color(0xFFC8D1E5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),

            const Text(
              "Gender",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      male = !male;
                      female = false;
                      both = false;
                    });

                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: fullTime
                                ? const Color(0xFFFF9200)
                                : const Color(0xFFC8D1E5))),
                    child: Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: fullTime ? const Color(0xFFFF9200) : const Color(0xFFC8D1E5),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      female = !female;
                      male = false;
                      male = false;
                    });

                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: partTime
                                ? const Color(0xFFFF9200)
                                : const Color(0xFFC8D1E5))),
                    child: Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: partTime ? const Color(0xFFFF9200) : const Color(0xFFC8D1E5),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      both = !both;
                      male = false;
                      female = false;
                    });

                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: freelance
                                ? const Color(0xFFFF9200)
                                : const Color(0xFFC8D1E5))),
                    child: Text(
                      "Freelance",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: freelance ? const Color(0xFFFF9200) : const Color(0xFFC8D1E5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  height: 60,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFC107),
                        Color(0xFFFF8205),
                      ],
                    ),
                  ),
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}