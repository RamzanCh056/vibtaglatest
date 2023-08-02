import 'package:flutter/material.dart';
import 'package:vibetag/screens/product_trend/gried_view_product.dart';
import '../product_home_page/grid_View2.dart';
import '../register/reusabletext.dart';

class ProductTrends extends StatefulWidget {
  const ProductTrends({Key? key}) : super(key: key);

  @override
  State<ProductTrends> createState() => _ProductTrendsState();
}

class _ProductTrendsState extends State<ProductTrends> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xffF1F4FB)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        suffixIcon: Image(
                          height: 30,
                          width: 30,
                          image: AssetImage("Asset/icons/movie/adjust.png"),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff99A7C7)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff99A7C7),
                        ),
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search for anything",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffFFFFFF),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ReusableText(
                                      title: 'Best match',
                                      size: 12,
                                      weight: FontWeight.w500,
                                      color: Color(0xff485470),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xff485470),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffFFFFFF),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ReusableText(
                                      title: 'Distance',
                                      size: 12,
                                      weight: FontWeight.w500,
                                      color: Color(0xff485470),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xff485470),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffFFFFFF),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ReusableText(
                                      title: 'Free Delivery',
                                      size: 12,
                                      weight: FontWeight.w500,
                                      color: Color(0xff485470),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xff485470),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff478CCA),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Color(0xffFFFFFF),
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableText(
                      title: 'Trending Products',
                      size: 16,
                      weight: FontWeight.w700,
                      color: Color(0xff485470),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    ReusableText(
                      title: '2441064 items found for "Trending"',
                      size: 12,
                      weight: FontWeight.w500,
                      color: Color(0xff485470),
                    ),
                  ],
                ),
              ),
            ),
            GridViewRepeatProduct(),
          ],
        ),
      ),
    ));
  }
}
