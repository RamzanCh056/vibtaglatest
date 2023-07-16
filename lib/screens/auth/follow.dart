import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';

Widget followWidget({required List<dynamic> famousUsers}) {
  bool isFollowing = false;

  return StatefulBuilder(builder: (context, setState) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return ListView.builder(
      itemCount: famousUsers.length,
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
                    borderRadius: BorderRadius.circular(
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        width * 0.03,
                      ),
                      topRight: Radius.circular(
                        width * 0.03,
                      ),
                    ),
                    child: Image.network(
                      famousUsers[i]['cover'],
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
                    borderRadius: BorderRadius.circular(
                      width * 0.01,
                    ),
                    child: Image.network(
                      famousUsers[i]['flag'],
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
                    borderRadius: BorderRadius.circular(
                      width * 0.01,
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: width * 0.1,
                        foregroundImage: NetworkImage(
                          famousUsers[i]['avatar'],
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
                        "${famousUsers[i]['first_name']} ${famousUsers[i]['last_name']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '@${famousUsers[i]['username']}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        famousUsers[i]['country_name'],
                        style: TextStyle(
                          color: Color.fromARGB(255, 128, 126, 126),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            width * 0.01,
                          ),
                          color: HexColor('#F0F0F0'),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.005),
                        child: Column(
                          children: [
                            const FittedBox(
                              child: Text(
                                'Likes',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 128, 126, 126),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Container(
                              width: width * 0.15,
                              height: height * 0.002,
                              color: Color.fromARGB(255, 173, 170, 170),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Text(
                              famousUsers[i]['total_likes_'].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            width * 0.01,
                          ),
                          color: HexColor('#F0F0F0'),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.005),
                        child: Column(
                          children: [
                            const FittedBox(
                              child: Text(
                                'Following',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 128, 126, 126),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Container(
                              width: width * 0.15,
                              height: height * 0.002,
                              color: Color.fromARGB(255, 173, 170, 170),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Text(
                              famousUsers[i]['total_following_'].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            width * 0.01,
                          ),
                          color: HexColor('#F0F0F0'),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.005),
                        child: Column(
                          children: [
                            const FittedBox(
                              child: Text(
                                'Followers',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 128, 126, 126),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Container(
                              width: width * 0.15,
                              height: height * 0.002,
                              color: Color.fromARGB(255, 173, 170, 170),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Text(
                              famousUsers[i]['total_followers_'].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
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
                    setState(() {
                      isFollowing = !isFollowing;
                    });
                    
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.3,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(
                        width * 0.03,
                      ),
                    ),
                    child: Text(
                      isFollowing ? 'Following' : 'Follow',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  });
}
