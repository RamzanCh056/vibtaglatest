import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/screens/new_shop/widget/on_sale.dart';
import 'package:vibetag/screens/new_shop/widget/product_blog.dart';
import 'package:vibetag/screens/new_shop/widget/product_widget.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int currentIndex = 0;
  List<Widget> screens = [OnSaleWidget(), Container(), Container()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: white,
          ),
          child: Column(
            children: [
              NavBar(),
              Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: width,
                      //   child: Image.asset(
                      //     'assets/shop/main_slider.png',
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      Container(
                        width: width,
                        margin: spacing(horizontal: 10, vertical: 10),
                        child: ClipRRect(
                          borderRadius: borderRadius(7),
                          child: Image.asset(
                            'assets/shop/winter_slide.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: width * 0.45,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              color: HexColor('#C9FCEA'),
                              borderRadius: borderRadius(20),
                            ),
                          ),
                          Container(
                            height: width * 0.45,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              color: HexColor('#D1C8FF'),
                              borderRadius: borderRadius(20),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: width,
                        margin: spacing(horizontal: 10, vertical: 10),
                        child: ClipRRect(
                          borderRadius: borderRadius(7),
                          child: Image.asset(
                            'assets/shop/banner_ads.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      gap(h: 10),
                      Container(
                        margin: spacing(horizontal: 10, vertical: 10),
                        child: Text(
                          'Just For You',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope',
                            color: blackPrimary,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        margin: spacing(horizontal: 20, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                currentIndex = 0;
                                setState(() {});
                              },
                              child: Text(
                                'Just For You',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: currentIndex == 0
                                      ? HexColor('#3C9CDF')
                                      : HexColor('#7D8CAC'),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                currentIndex = 1;
                                setState(() {});
                              },
                              child: Text(
                                'Popular',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: currentIndex == 1
                                      ? HexColor('#3C9CDF')
                                      : HexColor('#7D8CAC'),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                currentIndex = 2;
                                setState(() {});
                              },
                              child: Text(
                                'New Arrival',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: currentIndex == 2
                                      ? HexColor('#3C9CDF')
                                      : HexColor('#7D8CAC'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      screens[currentIndex],
                      gap(h: 15),
                      ClipRRect(
                        borderRadius: borderRadius(7),
                        child: Container(
                          width: double.infinity,
                          margin: spacing(horizontal: 10),
                          child: Image.asset(
                            'assets/shop/beat_studio.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      gap(h: 15),
                      ClipRRect(
                        borderRadius: borderRadius(7),
                        child: Container(
                          width: double.infinity,
                          margin: spacing(horizontal: 10),
                          child: Image.asset(
                            'assets/shop/watch.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      gap(h: 15),
                      Container(
                        margin: spacing(horizontal: 10, vertical: 10),
                        child: Text(
                          'Product On Sale',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope',
                            color: blackPrimary,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      gap(h: 10),
                      OnSaleWidget(),
                      gap(h: 15),
                      ClipRRect(
                        borderRadius: borderRadius(7),
                        child: Container(
                          width: double.infinity,
                          margin: spacing(horizontal: 10),
                          child: Image.asset(
                            'assets/shop/apple_watch.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      gap(h: 15),
                      ClipRRect(
                        borderRadius: borderRadius(7),
                        child: Container(
                          width: double.infinity,
                          margin: spacing(horizontal: 10),
                          child: Image.asset(
                            'assets/shop/jabra.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      gap(h: 15),
                      Container(
                        width: width,
                        padding: spacing(vertical: 15),
                        decoration: BoxDecoration(
                          color: HexColor('#ff99ab'),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: width * 0.7,
                              child: Center(
                                child: Text(
                                  'People just added to their Wishlist',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manrope',
                                    color: white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  gap(w: 10),
                                  ProductWidget(),
                                  ProductWidget(),
                                  ProductWidget(),
                                  ProductWidget(),
                                  ProductWidget(),
                                  ProductWidget(),
                                  gap(w: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      gap(h: 15),

                      Container(
                        width: width,
                        padding: spacing(vertical: 15),
                        decoration: BoxDecoration(
                          color: HexColor('#f4e4c9'),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'MAGAZINE',
                              style: TextStyle(
                                fontSize: 48,
                              ),
                            ),
                            Text('A world of inspiration'),
                            Text('READ MARKET SHOP MAGAZINE'),
                            ProductBlog(
                              image: 'assets/shop/cute_gril.jpg',
                              text:
                                  'Embracing the Colour of Spring: How to Add a Pop of Color to Your Wardrobe | ',
                            ),
                            ProductBlog(
                              image: 'assets/shop/kid.jpg',
                              text: 'Cradle to Cradle | #vibetag',
                            ),
                            ProductBlog(
                              image: 'assets/shop/wild.jpg',
                              text:
                                  'Go wild in your garden! Large or small, ledge or yard, your garden can be a mosaic in a wider network of natural havens linking urban green spaces with nature reserves and the countryside | ',
                            ),
                            ProductBlog(
                              image: 'assets/shop/makeup.jpg',
                              text: 'Beauty trend alert: Draping | ',
                            ),
                          ],
                        ),
                      ),
                      gap(h: 150),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
