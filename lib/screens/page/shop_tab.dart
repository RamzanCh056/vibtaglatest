import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';

import '../../utils/constant.dart';

class PageShop extends StatefulWidget {
  final String page_id;
  const PageShop({super.key, required this.page_id});

  @override
  State<PageShop> createState() => _PageShopState();
}

class _PageShopState extends State<PageShop> {
  bool isLoading = false;
  List<dynamic> products = [];
  @override
  void initState() {
    super.initState();
    getPageProducts();
  }

  getPageProducts() async {
    isLoading = true;
    setState(() {});
    final result = await API().postData({
      'type': 'get_page_products',
      'action': 'get_page_products',
      'page_id': widget.page_id,
    });
    products = jsonDecode(result.body)['data'];
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : products.length == 0
            ? Center(
                child: Text('No product yet'),
              )
            : Container(
                width: width,
                height: height * 0.7,
                color: backgroundColor,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      margin: spacing(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      child: ClipRRect(
                        borderRadius: borderRadius(7),
                        child: Container(
                          color: white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: borderRadius(7),
                                child: Container(
                                  height: height * 0.15,
                                  width: double.maxFinite,
                                  child: Image.network(
                                    products[i]['images'][0]['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              gap(h: 10),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(7),
                                    bottomRight: Radius.circular(7),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: width * 0.45,
                                      child: Text(
                                        products[i]['name'],
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.45,
                                      child: Text(
                                        '\$${products[i]['price']}',
                                        style: TextStyle(
                                          color: orange,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        padding: spacing(
                                          horizontal: 5,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orangePrimary,
                                          borderRadius: borderRadius(5),
                                        ),
                                        width: width * 0.45,
                                        child: Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                            color: white,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    gap(h: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
  }
}
