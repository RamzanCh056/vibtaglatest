
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibetag/screens/product_screen/widget/button.dart';
import 'package:vibetag/screens/product_screen/widget/right_table.dart';
import '../product_catagory/Product _category_list.dart';
import '../product_catagory/widget/magazine.dart';
import '../product_catagory/widget/salesitem.dart';
import 'widget/left_table.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: SafeArea(
        child: ListView(
          children: [
           // TopAppbar(),
            AppBar(
              backgroundColor: const Color(0xffFF9200),
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
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xffFF9200),
                                )),
                            hintText: 'Search...',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: const OutlineInputBorder(
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
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/mesge.png"),
                            fit: BoxFit.cover)),

                    // ),
                    // backgroundColor: Colors.white10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/dropdown.png"),
                            fit: BoxFit.fill)),
                  ),

                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCategory()));

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 280, top: 10),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("assets/arrowbackward.svg"),
                        Image.asset(
                          "assets/trm.png",
                          height: 180,
                        ),
                        SvgPicture.asset("assets/arrowforward.svg"),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                "Morphy Richards 102783 ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "London, UK· 90 In stock ",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                "£40.00",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: null,
                  hint: Text("Delivery"),
                  onChanged: (value) {},
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFFFF9200)),
                  onPressed: () {},
                  child: Text(
                    "Add",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  "assets/headphoneicon.svg",
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Contact Seller",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  "assets/bookmarkstaricon.svg",
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Type | Brand New",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  "assets/vehiclesicon.svg",
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Standard Delivery | 13 - 17 Days",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  "assets/bookmarkstaricon.svg",
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Model Number : KTTVIB89912a\nDesign : Kettles",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  // I created two table because of edges of left and right
                  Expanded(
                    child: LeftTable(
                      modelNo: "Model Numberr",
                      amountOfStok: "Amount of stock",
                      deliveryType: "delivery type",
                      brand: "Brand",
                      returnable: "Returnable",
                    ),
                  ),
                  Expanded(
                    child: RightTable(
                      modelNo: "KTTVIB89912a",
                      amountOfStok: "90",
                      deliveryType: "Free",
                      brand: "Morphy Richards",
                      returnable: "No",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // dropdownButton
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: null,
                  hint: Text("Additional"),
                  onChanged: (value) {},
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // dropdownButton
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: null,
                  hint: Text("Reviews"),
                  onChanged: (value) {},
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // About Seller
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "About Sellers",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF717171),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_up,
                          color: Color(0xFF717171),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xFFB4B4B4),
                  ),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(3),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9200),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    title: Text(
                      "Sellers name",
                      style: TextStyle(color: Color(0xFF717171), fontSize: 18),
                    ),
                    subtitle: Text(
                      "When in need of a\nnew laptop ",
                      style: TextStyle(
                        color: Color(0xFF717171),
                      ),
                    ),
                    trailing: FittedBox(
                        child: Button(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Like"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.thumb_up)
                        ],
                      ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 75, top: 10),
                    child: Row(
                      children: [
                        Button(
                            onPressed: () {},
                            child: Text(
                              "1 Like",
                              style: TextStyle(fontSize: 10),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Button(
                            onPressed: () {},
                            child: Text(
                              "85 Products",
                              style: TextStyle(fontSize: 10),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Button(
                          onPressed: () {},
                          child: Text(
                            "10 Recations",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75, right: 15),
                    child: Button(
                      onPressed: () {},
                      child: Text(
                        "5  Shop Review",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //Bought Together1
            Container(
                width: 50,
                height: 40,
                margin: EdgeInsets.only(left: 15, right: 170),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Bought Together",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
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
                    return SalesItem(
                      title: "Toomax Storaway 1670",
                      button1Text: "Garden & Pets",
                      price: "£220.00",
                      button2Text: "Storage",
                      oldPrice: "£235.00",
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),

            //Bought Together2
            Container(
                width: 50,
                height: 40,
                margin: EdgeInsets.only(left: 15, right: 170),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Bought Together",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
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
                    return SalesItem(
                      title: "Toomax Storaway 1670",
                      button1Text: "Garden & Pets",
                      price: "£220.00",
                      button2Text: "Storage",
                      oldPrice: "£235.00",
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            //Bought Together3
            Container(
                width: 50,
                height: 40,
                margin: EdgeInsets.only(left: 15, right: 170),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Bought Together",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
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
                    return SalesItem(
                      title: "Toomax Storaway 1670",
                      button1Text: "Garden & Pets",
                      price: "£220.00",
                      button2Text: "Storage",
                      oldPrice: "£235.00",
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            //People just added to their Wishlist,
            Container(
              height: 350,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "People just added to their Wishlist",
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
                          return SalesItem(
                            title: "Toomax Storaway 1670",
                            button1Text: "Garden & Pets",
                            price: "£220.00",
                            button2Text: "Storage",
                            oldPrice: "£235.00",
                          );
                        }),
                  ),
                ],
              ),
            ),

            // Magazine
            SizedBox(
              height: 50,
            ),
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
