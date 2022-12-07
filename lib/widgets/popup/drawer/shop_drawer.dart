import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/cart.dart';
import 'package:vibetag/screens/find_friends.dart';
import 'package:vibetag/widgets/popup/drawer/drawer_item.dart';
import 'package:vibetag/widgets/shop_category_item.dart';

import '../../../utils/constant.dart';

class ShopMenu extends StatefulWidget {
  const ShopMenu({super.key});

  @override
  State<ShopMenu> createState() => _ShopMenuState();
}

class _ShopMenuState extends State<ShopMenu> {
  TextEditingController homeCate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Drawer(
      width: width * 0.8,
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      elevation: 0,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.19,
                color: Color.fromARGB(0, 255, 255, 255),
                padding: spacing(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  height: height * 0.8,
                  color: Colors.black,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.05,
                        ),
                        ShopCategoryItems(
                          items: ['Home', 'kettles'],
                          controller: homeCate,
                          first: 'Home',
                        ),
                        ShopCategoryItems(
                          items: ['Free items', 'kettles'],
                          controller: homeCate,
                          first: 'Free items',
                        ),
                        ShopCategoryItems(
                          items: ['Vehicles', 'kettles'],
                          controller: homeCate,
                          first: 'Vehicles',
                        ),
                        ShopCategoryItems(
                          items: ['Baby & Toddler', 'kettles'],
                          controller: homeCate,
                          first: 'Baby & Toddler',
                        ),
                        ShopCategoryItems(
                          items: ['Beauty & Care', 'kettles'],
                          controller: homeCate,
                          first: 'Beauty & Care',
                        ),
                        ShopCategoryItems(
                          items: ['Home Furniture', 'kettles'],
                          controller: homeCate,
                          first: 'Home Furniture',
                        ),
                        ShopCategoryItems(
                          items: ['Housing & Properties', 'kettles'],
                          controller: homeCate,
                          first: 'Housing & Properties',
                        ),
                        ShopCategoryItems(
                          items: ['Gift & Gewellery', 'kettles'],
                          controller: homeCate,
                          first: 'Gift & Gewellery',
                        ),
                        ShopCategoryItems(
                          items: ['Garden and Pets', 'kettles'],
                          controller: homeCate,
                          first: 'Garden and Pets',
                        ),
                        ShopCategoryItems(
                          items: ['Fasion', 'kettles'],
                          controller: homeCate,
                          first: 'Fasion',
                        ),
                        ShopCategoryItems(
                          items: ['Groceries', 'kettles'],
                          controller: homeCate,
                          first: 'Groceries',
                        ),
                        ShopCategoryItems(
                          items: ['Sports', 'kettles'],
                          controller: homeCate,
                          first: 'Sports',
                        ),
                        ShopCategoryItems(
                          items: ['Motor Parts', 'kettles'],
                          controller: homeCate,
                          first: 'Motor Parts',
                        ),
                        ShopCategoryItems(
                          items: ['School', 'kettles'],
                          controller: homeCate,
                          first: 'School',
                        ),
                        ShopCategoryItems(
                          items: ['Festive & Celebration', 'kettles'],
                          controller: homeCate,
                          first: 'Festive & Celebration',
                        ),
                        ShopCategoryItems(
                          items: ['Appliances', 'kettles'],
                          controller: homeCate,
                          first: 'Appliances',
                        ),
                        ShopCategoryItems(
                          items: ['Home Decore', 'kettles'],
                          controller: homeCate,
                          first: 'Home Decore',
                        ),
                        ShopCategoryItems(
                          items: ['Toy', 'kettles'],
                          controller: homeCate,
                          first: 'Toy',
                        ),
                      ],
                    ),
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
