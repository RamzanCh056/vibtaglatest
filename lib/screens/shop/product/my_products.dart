import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/page/add_page.dart';
import 'package:vibetag/screens/shop/my_product_widget.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../../utils/constant.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/header.dart';
import '../../../widgets/navbar.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: HexColor('#7B7B7B'),
                                    ),
                                  ),
                                ),
                                child: TabBar(
                                  indicatorPadding: EdgeInsets.zero,
                                  indicatorWeight: 4,
                                  padding: spacing(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  isScrollable: true,
                                  unselectedLabelColor: HexColor('#7B7B7B'),
                                  labelColor: Colors.orange,
                                  indicatorColor: Colors.orange,
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  onTap: (value) {
                                    if (value == 3) {
                                      pushRoute(
                                        context: context,
                                        screen: AddNewPag(),
                                      );
                                    }
                                  },
                                  tabs: [
                                    const Tab(
                                      icon: Text('My Products'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    const Tab(
                                      icon: Text('Market'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      iconMargin: const EdgeInsets.all(0),
                                      icon: Container(
                                        width: width * 0.18,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: borderRadius(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Create',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Container(
                                              width: 15,
                                              child: const SvgIcon(
                                                'assets/svg/chat/plus.svg',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      text: '',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: width,
                                  height: height * 0.8,
                                  child: TabBarView(
                                    children: [
                                      MyProductsWiget(),
                                      Container(),
                                      Container(),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SecondaryFooter(),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
