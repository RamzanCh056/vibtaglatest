import 'package:flutter/material.dart';
import 'customrow.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            CustomRow(title: "Home",onTap: (){},),
            CustomRow(title: "Free items",onTap: (){},),
            CustomRow(title: "Vehicles",onTap: (){
            //   Get.to(ProductCategory());
            // },),
            // CustomRow(title: "Baby & Toddler",onTap: (){
            //   Get.to(ProductCategory());
            // },),
            // CustomRow(title: "Beauty & Care",onTap: (){
            //   Get.to(ProductCategory());
            // },),
            // CustomRow(title: "Home Furniture",onTap: (){
            //   Get.to(ProductCategory());
            },),
            CustomRow(title: "Housing & Properties",onTap: (){},),
            CustomRow(title: "Gift & Gewellery",onTap: (){},),
            CustomRow(title: "Garden & Pets",onTap: (){},),
            CustomRow(title: "Fasion",onTap: (){},),
            CustomRow(title: "Groceries",onTap: (){},),
            CustomRow(title: "Sports",onTap: (){},),
            CustomRow(title: "Motor Parts",onTap: (){},),
            CustomRow(title: "School",onTap: (){},),
            CustomRow(title: "Festive & Celebration",onTap: (){},),


          ],
        ),
      );

  }
}
