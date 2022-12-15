import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/shop/cart.dart';
import 'package:vibetag/screens/find%20friends/find_friends.dart';
import 'package:vibetag/screens/drawer/drawer_item.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';

import '../../utils/constant.dart';

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
                        DropDownList(
                          items: ['Home', 'kettles'],
                          controller: homeCate,
                          first: 'Home',
                        ),
                        DropDownList(
                          items: ['Free items', 'kettles'],
                          controller: homeCate,
                          first: 'Free items',
                        ),
                        DropDownList(
                          items: ['Vehicles', 'kettles'],
                          controller: homeCate,
                          first: 'Vehicles',
                        ),
                        DropDownList(
                          items: ['Baby & Toddler', 'kettles'],
                          controller: homeCate,
                          first: 'Baby & Toddler',
                        ),
                        DropDownList(
                          items: ['Beauty & Care', 'kettles'],
                          controller: homeCate,
                          first: 'Beauty & Care',
                        ),
                        DropDownList(
                          items: ['Home Furniture', 'kettles'],
                          controller: homeCate,
                          first: 'Home Furniture',
                        ),
                        DropDownList(
                          items: ['Housing & Properties', 'kettles'],
                          controller: homeCate,
                          first: 'Housing & Properties',
                        ),
                        DropDownList(
                          items: ['Gift & Gewellery', 'kettles'],
                          controller: homeCate,
                          first: 'Gift & Gewellery',
                        ),
                        DropDownList(
                          items: ['Garden and Pets', 'kettles'],
                          controller: homeCate,
                          first: 'Garden and Pets',
                        ),
                        DropDownList(
                          items: ['Fasion', 'kettles'],
                          controller: homeCate,
                          first: 'Fasion',
                        ),
                        DropDownList(
                          items: ['Groceries', 'kettles'],
                          controller: homeCate,
                          first: 'Groceries',
                        ),
                        DropDownList(
                          items: ['Sports', 'kettles'],
                          controller: homeCate,
                          first: 'Sports',
                        ),
                        DropDownList(
                          items: ['Motor Parts', 'kettles'],
                          controller: homeCate,
                          first: 'Motor Parts',
                        ),
                        DropDownList(
                          items: ['School', 'kettles'],
                          controller: homeCate,
                          first: 'School',
                        ),
                        DropDownList(
                          items: ['Festive & Celebration', 'kettles'],
                          controller: homeCate,
                          first: 'Festive & Celebration',
                        ),
                        DropDownList(
                          items: ['Appliances', 'kettles'],
                          controller: homeCate,
                          first: 'Appliances',
                        ),
                        DropDownList(
                          items: ['Home Decore', 'kettles'],
                          controller: homeCate,
                          first: 'Home Decore',
                        ),
                        DropDownList(
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
