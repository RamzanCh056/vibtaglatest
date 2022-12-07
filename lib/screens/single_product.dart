import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/shop_header.dart';

import '../utils/constant.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  NavBar(),
                  Header(
                    onTap: () {},
                  ),
                  ShopHeader(
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
