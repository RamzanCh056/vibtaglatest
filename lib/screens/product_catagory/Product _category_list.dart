import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibetag/screens/product_catagory/widget/magazine.dart';
import 'package:vibetag/screens/product_catagory/widget/salesitem.dart';
import 'package:vibetag/screens/product_screen/store_home/Store-home-mobile-screen.dart';

import 'widget/bottom_appbar.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: ListView(
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
          BottomAppbar(),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreHome()));
              // Get.to(StoreHome());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Home > Fashion",
                style: TextStyle(color: Color(0xFFFF9200)),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          //Search product
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
          //Location
          Container(
            height: 90,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                Row(
                  children: [
                    Slider(
                      value: 30,
                      onChanged: (value) {},
                      min: 0,
                      max: 100,
                      thumbColor: Colors.black,
                      activeColor: Color(0xFFFF9200),
                      inactiveColor: Color(0xFFEFEFEF),
                    ),
                    Text(
                      "7",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              )),
                          child: Icon(Icons.arrow_drop_up),
                        ),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              )),
                          child: Icon(Icons.arrow_drop_up),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "7",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //Sort
          Container(
            height: 90,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sort",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                SizedBox(
                  height: 5,
                ),
                //drop_down_Button
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: null,
                      hint: Text(
                        "Lates",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (value) {},
                      isExpanded: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //fashion for
                Row(
                  children: [
                    Text("Fashion for"),
                    Spacer(),
                    SvgPicture.asset("assets/arrowup.svg")
                  ],
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Dresses",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "womens outfits",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Plus Size Clothing",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Maternity Clothing",
                  style: TextStyle(color: Colors.grey),
                ),
                // DropDown Button Set1
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Hoodies",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Knitwear",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Tops",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                // DropDown Button Set2
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Hoodies",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Knitwear",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Tops",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                // DropDown Button Set3
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Hoodies",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Knitwear",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Tops",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                // DropDown Button Set4
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Hoodies",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Knitwear",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Tops",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                // DropDown Button Set5
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Hoodies",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Knitwear",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Tops",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                // DropDown Button Set6
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Hoodies",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Knitwear",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Tops",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                // DropDown Button Set7
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Hoodies",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Knitwear",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Tops",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: SvgPicture.asset("assets/arrowdown.svg"),
                    items: null,
                    hint: Text(
                      "Women’s Coats & Jackets",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                ),
                //Fashion for men
                Row(
                  children: [
                    Text("Fashion for men"),
                    Spacer(),
                    SvgPicture.asset("assets/arrowup.svg")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //Fashion for girls
                Row(
                  children: [
                    Text("Fashion for girls"),
                    Spacer(),
                    SvgPicture.asset("assets/arrowup.svg")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //Fashion for boys
                Row(
                  children: [
                    Text("Fashion for boys"),
                    Spacer(),
                    SvgPicture.asset("assets/arrowup.svg")
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SalesItem(
                        title: "Toomax Storaway 1670",
                        button1Text: "Garden & Pets",
                        price: "£220.00",
                        button2Text: "Storage",
                        oldPrice: "£235.00",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      "2",
                    ),
                    Text(
                      "3",
                    ),
                    Text(
                      "4",
                    ),
                    Text(
                      "5",
                    ),
                    Text(
                      "6",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
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
        ],
      ),
    );
  }
}
