import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _currentIndex = 0;

  final List<String> title = [
    "Browse Events",
    "Ongoing",
    "Invited",
    "Joined",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD3D3D3),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                    children: List.generate(title.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        gradient: _currentIndex == index
                            ? LinearGradient(colors: const [
                                Color(0XFFFDBA31),
                                Color(0XFFFF9200),
                              ])
                            : LinearGradient(colors: const [
                                Color(0XFFFFFFFF),
                                Color(0XFFFFFFFF),
                              ]),
                      ),
                      child: Text(
                        title[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: _currentIndex == index
                              ? Colors.white
                              : Color(0xFF485470),
                        ),
                      ),
                    ),
                  );
                })),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(13),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 196,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10),),
                                    child: Image.asset("assets/images/im.png",fit: BoxFit.cover,))),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Cricket Match PSL 8 this year",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFF4E5),
                                      ),
                                      child: Image.asset("assets/images/Calendar.png"),
                                    ),
                                    title: Text(
                                      "14 December, 2021",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      "Tuesday, 4:00PM - 9:00PM",
                                      style: TextStyle(
                                        color: Color(0xFF747688),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11),
                                    ),
                                  ),

                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFF4E5),
                                      ),
                                      child: Image.asset("assets/images/location.png"),
                                    ),
                                    title: Text(
                                      "Gala Convention Center",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      "36 Rot street, Los angeles",
                                      style: TextStyle(
                                          color: Color(0xFF747688),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 42,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFFFC107),
                                        Color(0xFFFF8205),
                                      ],),
                                    ),
                                    child: Text("Join Now",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
