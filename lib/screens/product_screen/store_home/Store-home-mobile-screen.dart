import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibetag/screens/product_screen/store_home/widget/categories.dart';
import '../../product_catagory/widget/magazine.dart';
import '../../product_catagory/widget/salesitem.dart';
import '../productScreen.dart';
import 'widget/drawer.dart';

class StoreHome extends StatefulWidget {
   StoreHome({Key? key}) : super(key: key);

  @override
  State<StoreHome> createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffF1F1F1),
      // drawer: const Draweer(),
      // endDrawer:  DrawerScreen(),

      appBar: AppBar(
        backgroundColor: Color(0xffFF9200),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xffFF9200),
                      ),
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Image.asset(
                  'images/Exclusion 1.PNG',
                  height: 29,
                  fit: BoxFit.fill,
                ),
                // backgroundColor: Colors.white10,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewStatus()));
                // Get.to(CreateNewStatus());
              },
              child: Container(
                child: Image.asset(
                  'images/Path 2.png',
                  height: 25,
                  fit: BoxFit.fill,
                ),
                // backgroundColor: Colors.white10,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [


           // BottomAppbar(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/home.jpg"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //ListView.builder
            Container(
              height: 152,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: Color(0xFFE3E3E3),
                      height: 152,
                      width: MediaQuery.of(context).size.width,
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            //TextField
            Row(
              children: [
                //TextField
                Container(
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFFF9200),
                      ),
                      hintText: "Search products",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                //addButton
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF9200),
                  ),
                  child: SvgPicture.asset("assets/plus.svg"),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 5),
                    color: Color(0xFFE3E3E3),
                    height: 152,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 15),
                    color: Color(0xFFE3E3E3),
                    height: 152,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Items on Sale
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Items on Sale",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //ListView.Builder
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));

                    },
                    child: Container(
                      height: 230,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: SalesItem(
                                title: "Toomax Storaway 1670",
                                button1Text: "Garden & Pets",
                                price: "£220.00",
                                button2Text: "Storage",
                                oldPrice: "£235.00",
                              ),
                            );
                          }),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFFF9200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/star.svg"),
                        SvgPicture.asset("assets/settings.svg"),
                        SvgPicture.asset("assets/refresh.svg"),
                        // Badge(
                        //     badgeContent: Text(
                        //       "2",
                        //       style:
                        //           TextStyle(color: Colors.white, fontSize: 12),
                        //     ),
                        //     padding: EdgeInsets.all(3),
                        //     child: SvgPicture.asset("assets/purchase.svg")),
                        SvgPicture.asset("assets/search.svg")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                "Our most trending categories that peoples buy most ",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Categories(
                    icon: "assets/women.svg",
                    text: "Women's",
                  ),
                  Categories(
                    icon: "assets/men.svg",
                    text: "Women's",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Categories(
                    icon: "assets/girl.svg",
                    text: "Girl's",
                  ),
                  Categories(
                    icon: "assets/boy.svg",
                    text: "Boy's",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Soft Light
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Soft Light",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                "Check the sport light of our products",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //ListView.Builder
            Container(
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            //ListView.Builder
            Container(
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              color: Color(0xFFE3E3E3),
              height: 160,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),

            Container(
              color: Color(0xFFE3E3E3),
              height: 160,
              width: MediaQuery.of(context).size.width,
            ),

            SizedBox(
              height: 30,
            ),

            // Toys
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Toys",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //ListView.Builder
                  Container(
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: SalesItem(
                              title: "Toomax Storaway 1670",
                              button1Text: "Garden & Pets",
                              price: "£220.00",
                              button2Text: "Storage",
                              oldPrice: "£235.00",
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFF9200)),
                          child: Text("See offers"),
                        ),
                        Spacer(),
                        Container(
                            height: 36,
                            width: 31,
                            decoration: BoxDecoration(
                                color: Color(0xFF707070),
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xFF8E8E8E),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 36,
                          width: 31,
                          decoration: BoxDecoration(
                              color: Color(0xFF707070),
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF8E8E8E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Container(
              color: Color(0xFFE3E3E3),
              height: 160,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Color(0xFFE3E3E3),
              height: 160,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Color(0xFFE3E3E3),
              height: 160,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),

            // Applications
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFEFEFEF),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Applications",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Check the modern appliances",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //ListView.Builder
                  Container(
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: SalesItem(
                              title: "Toomax Storaway 1670",
                              button1Text: "Garden & Pets",
                              price: "£220.00",
                              button2Text: "Storage",
                              oldPrice: "£235.00",
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFF9200)),
                          child: Text("See offers"),
                        ),
                        Spacer(),
                        Container(
                            height: 36,
                            width: 31,
                            decoration: BoxDecoration(
                                color: Color(0xFFB1B1B1),
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 36,
                          width: 31,
                          decoration: BoxDecoration(
                              color: Color(0xFFB1B1B1),
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //Peoples just added to their wishlists
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFEB1C3),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Peoples just added to their wishlists",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  //ListView.Builder
                  Container(
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: SalesItem(
                              title: "Toomax Storaway 1670",
                              button1Text: "Garden & Pets",
                              price: "£220.00",
                              button2Text: "Storage",
                              oldPrice: "£235.00",
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          child: Text("See offers"),
                        ),
                        Spacer(),
                        Container(
                            height: 36,
                            width: 31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xFFB1B1B1),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 36,
                          width: 31,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFFB1B1B1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // MAGAZINE
            Center(
                child: Text(
              "Magazine",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              "A world of inspiration",
              style: TextStyle(
                fontSize: 16,
              ),
            )),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              "READ MARKET SHOP MAGAZINE",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Magazine(
                  title1: "Cradle to Cradle",
                  title2: "#vibetagshop",
                  subtitle: "Read Story",
                )),
                Expanded(
                    child: Magazine(
                  title1: "Cradle to Cradle",
                  title2: "#vibetagshop",
                  subtitle: "Read Story",
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Magazine(
                  title1: "Cradle to Cradle",
                  title2: "#vibetagshop",
                  subtitle: "Read Story",
                )),
                Expanded(
                    child: Magazine(
                  title1: "Cradle to Cradle",
                  title2: "#vibetagshop",
                  subtitle: "Read Story",
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              color: Color(0xFFFF9200),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Market Place\nTerms",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your\nWishlist",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Refund\nPolicy",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "On Sale\nItems",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start\nSelling",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Find Help &\nSupport",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("C 2022 VibeTag"),
                  Spacer(),
                  Text("C 2022 VibeTag"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
