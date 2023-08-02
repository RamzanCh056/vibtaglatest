import 'package:flutter/material.dart';
import 'package:vibetag/screens/order_email/order_cancel.dart';
import '../register/reusabletext.dart';

class OrderDeliveredEmail extends StatefulWidget {
  const OrderDeliveredEmail({Key? key}) : super(key: key);

  @override
  State<OrderDeliveredEmail> createState() => _OrderDeliveredEmailState();
}

class _OrderDeliveredEmailState extends State<OrderDeliveredEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        elevation: 0,
        title: Center(
          child: Image(
            image: AssetImage("Asset/images/order/logo.png"),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Color(0xffF4FDF6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("Asset/images/order/delivered.png"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ReusableText(
                        title: 'Here is the Update of Order',
                        weight: FontWeight.w500,
                        size: 18,
                        color: Color(0xff090F19),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title: 'Order is Delivered',
                        weight: FontWeight.w700,
                        size: 34,
                        color: Color(0xff2AD352),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderCance()));
                          });
                        },
                        child: Container(
                          width: 212,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff000000)),
                          child: Center(
                            child: ReusableText(
                              title: 'View Order',
                              weight: FontWeight.w600,
                              size: 18,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ReusableText(
                  title: 'Hi Martin,',
                  weight: FontWeight.w700,
                  size: 18,
                  color: Color(0xff212121),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableText(
                  title:
                      'Thank you for shopping with us. Your order number #153 has\nDelivered.',
                  weight: FontWeight.w500,
                  size: 14,
                  color: Color(0xff212121),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xffC8D1E5),
                  height: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Payment Status',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      Spacer(),
                      Container(
                        height: 32,
                        width: 61,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xff2AD352)),
                            color: Color(0xffFDFEFE)),
                        child: Center(
                          child: ReusableText(
                            title: 'Paid',
                            weight: FontWeight.w400,
                            size: 16,
                            color: Color(0xff2AD352),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Phone Number',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '+1 248 557 145',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Order ID',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '#3243232',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Delivery Time',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '12:36 PM',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Order Date/Time',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '24-Jul-2022 / 11:46',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Payment Status',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      Spacer(),
                      Image(
                          image: AssetImage("Asset/icons/order/visa-logo.png")),
                      SizedBox(
                        width: 10,
                      ),
                      ReusableText(
                        title: 'Visa Ending **** 1234',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Payment Status',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '+1 248 557 145',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        title: 'Billing Address',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff000000),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title:
                            '65 E. Honey Creek Drive, Forest Hills Brooklyn, New York 11209,\nUnited States of America.',
                        weight: FontWeight.w500,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xffC8D1E5),
                  height: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage("Asset/images/order/handfre.png"),
                  ),
                  title: ReusableText(
                    title: 'Stereo Headset for Gaming',
                    weight: FontWeight.w700,
                    size: 16,
                    color: Color(0xff212121),
                  ),
                  subtitle: ReusableText(
                    title: 'Qty: 3\nRadionic, Color: Blue, Size: Medium',
                    weight: FontWeight.w500,
                    size: 13,
                    color: Color(0xff485470),
                  ),
                  trailing: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      ReusableText(
                        title: '\$23.00',
                        weight: FontWeight.w700,
                        size: 17,
                        color: Color(0xff212121),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title: '\$63.96',
                        weight: FontWeight.w500,
                        size: 13,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage("Asset/images/order/man.png"),
                  ),
                  title: ReusableText(
                    title: 'Out Cast Oversized Tshirt ',
                    weight: FontWeight.w700,
                    size: 16,
                    color: Color(0xff212121),
                  ),
                  subtitle: ReusableText(
                    title: 'Qty: 1\nRadionic, Color: Blue, Size: Medium',
                    weight: FontWeight.w500,
                    size: 13,
                    color: Color(0xff485470),
                  ),
                  trailing: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      ReusableText(
                        title: '\$15.00',
                        weight: FontWeight.w700,
                        size: 17,
                        color: Color(0xff212121),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title: '\$63.96',
                        weight: FontWeight.w500,
                        size: 13,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage("Asset/images/order/ring.png"),
                  ),
                  title: ReusableText(
                    title: 'Silver Bracelet',
                    weight: FontWeight.w700,
                    size: 16,
                    color: Color(0xff212121),
                  ),
                  subtitle: ReusableText(
                    title: 'Qty: 2\nRadionic, Color: Blue, Size: Large',
                    weight: FontWeight.w500,
                    size: 13,
                    color: Color(0xff485470),
                  ),
                  trailing: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      ReusableText(
                        title: '\$23.00',
                        weight: FontWeight.w700,
                        size: 17,
                        color: Color(0xff212121),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title: '\$63.96',
                        weight: FontWeight.w500,
                        size: 13,
                        color: Color(0xff485470),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xffC8D1E5),
                  height: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Sub Total',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '\$134',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff212121),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Discount (30% OFF)',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '-\$70',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff212121),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Delivery Tip',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '\$5',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff212121),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 52,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF1F4FB)),
                      color: Color(0xffFDFEFE)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Shipping Charge',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '\$34',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff212121),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xffC8D1E5),
                  height: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        title: 'Total (Inc. Tax)',
                        weight: FontWeight.w600,
                        size: 16,
                        color: Color(0xff485470),
                      ),
                      Spacer(),
                      ReusableText(
                        title: '\$153',
                        weight: FontWeight.w700,
                        size: 16,
                        color: Color(0xff212121),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 212,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff212121)),
                    child: Center(
                      child: ReusableText(
                        title: 'View Order',
                        weight: FontWeight.w400,
                        size: 16,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xffC8D1E5),
                  height: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                ReusableText(
                  title: 'Other Product',
                  weight: FontWeight.w600,
                  size: 20,
                  color: Color(0xff212121),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffC8D1E5)),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                                image:
                                    AssetImage("Asset/images/order/shoe.png")),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'Nike Runner Shoes',
                                    weight: FontWeight.w400,
                                    size: 14,
                                    color: Color(0xff485470),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ReusableText(
                                    title: '\$138',
                                    weight: FontWeight.w600,
                                    size: 15,
                                    color: Color(0xff212121),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffC8D1E5)),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                                image:
                                    AssetImage("Asset/images/order/toy.png")),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: '7 Colored yo-yo',
                                    weight: FontWeight.w400,
                                    size: 14,
                                    color: Color(0xff485470),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ReusableText(
                                    title: '\$20',
                                    weight: FontWeight.w600,
                                    size: 15,
                                    color: Color(0xff212121),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffC8D1E5)),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                                image: AssetImage(
                                    "Asset/images/order/keychain.png")),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'Necklace for men',
                                    weight: FontWeight.w400,
                                    size: 14,
                                    color: Color(0xff485470),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ReusableText(
                                    title: '\$16',
                                    weight: FontWeight.w600,
                                    size: 15,
                                    color: Color(0xff212121),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff212121),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage("Asset/images/order/logo.png"),
                        ),
                        ReusableText(
                          title:
                              '65 E. Honey Creek Drive,\nForest Hills Brooklyn,  New\nYork 11209, US',
                          weight: FontWeight.w400,
                          size: 13,
                          color: Color(0xffC8D1E5),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ReusableText(
                          title: 'More Links',
                          weight: FontWeight.w600,
                          size: 15,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ReusableText(
                          title:
                              'Help Center\n\nMy Account\n\nContact Us\n\nPrivacy Policy',
                          weight: FontWeight.w400,
                          size: 14,
                          color: Color(0xffC8D1E5),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ReusableText(
                          title: 'Download the App',
                          weight: FontWeight.w600,
                          size: 15,
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image:
                                    AssetImage("Asset/icons/order/apple.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'Download on the',
                                    weight: FontWeight.w400,
                                    size: 10,
                                    color: Color(0xff212121),
                                  ),
                                  ReusableText(
                                    title: 'App Store',
                                    weight: FontWeight.w600,
                                    size: 13,
                                    color: Color(0xff212121),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    "Asset/icons/order/playstore.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'Download on the',
                                    weight: FontWeight.w400,
                                    size: 10,
                                    color: Color(0xff212121),
                                  ),
                                  ReusableText(
                                    title: 'Google Play',
                                    weight: FontWeight.w600,
                                    size: 13,
                                    color: Color(0xff212121),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 3,
                  height: 3,
                  color: Color(0xffFFFFFF).withOpacity(0.16),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    ReusableText(
                      title: '@2022 Vibetag. All Rights Reserved.',
                      weight: FontWeight.w400,
                      size: 13,
                      color: Color(0xffC8D1E5),
                    ),
                    Spacer(),
                    ReusableText(
                      title: 'Unsubcribe',
                      weight: FontWeight.w400,
                      size: 13,
                      color: Color(0xffFFFFFF),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
