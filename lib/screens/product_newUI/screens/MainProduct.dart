import 'package:flutter/material.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/screens/product_newUI/screens/product_detail_tab.dart';

import '../../../widgets/navbar.dart';
import 'about_seller_tab.dart';
import 'bottom_sheet.dart';
import 'info_tab.dart';
import 'rating_and_review_tab.dart';


class MainProduct extends StatefulWidget {
  const MainProduct({Key? key}) : super(key: key);

  @override
  State<MainProduct> createState() => _MainProductState();
}

class _MainProductState extends State<MainProduct> {
  int _currentIndex = 0;
  final List _pages = [
    const InfoTab(),
    const ProductDetailScreen(),
    const AboutSeller(),
    const RatingAndReview(),
  ];

  final List<String> title = [
    "Info",
    "Product Detail",
    "About Seller",
    "Rating & Review",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
        Column(
              children: [
                NavBar(),
                Header(),
              ],
            ),
      Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/headphone.jpg",
                  fit: BoxFit.cover,
                  height: 230,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 250),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(17),
                ),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Air Max Best Sound Quality Active Noise Cancellation Wireless Headphones",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      color: Color(0xFFFFB13D),
                                    )),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("33 Reviews"),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Color(0xFFC8D1E5),
                        ),
                        const Text(
                          "\$ 249.99",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFF27F12),
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            const Text(
                              "\$290.99",
                              style: TextStyle(
                                  color: Color(0xFF7D8CAC),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "-40%",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0xFFC8D1E5),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                          children: List.generate(title.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              gradient: _currentIndex == index
                                  ? const LinearGradient(colors: [
                                      Color(0XFFFDBA31),
                                      Color(0XFFFF9200),
                                    ])
                                  : const LinearGradient(colors: [
                                      Color(0XFFF1F4FB),
                                      Color(0XFFF1F4FB),
                                    ]),
                            ),
                            child: Text(
                              title[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: _currentIndex == index
                                    ? Colors.white
                                    : const Color(0xFF485470),
                              ),
                            ),
                          ),
                        );
                      })),
                    ),
                  ),
                  _pages[_currentIndex],
                ],
              ),
            ),
            _currentIndex != 0
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xFF485470),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/chatting.png"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Chat",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return const BottomSheetDetail();
                                  },
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color(0xFFFF9200),
                                ),
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: const Color(0xFFFF9200),
                                  )),
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF9200),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
