import 'package:flutter/material.dart';

import 'add_product_screen.dart';
import 'add_product_screen2(1).dart';

class AddProductScreen3 extends StatefulWidget {
  @override
  State<AddProductScreen3> createState() => _AddProductScreen3State();
}

class _AddProductScreen3State extends State<AddProductScreen3> {
  String? selectedCategory;
  void _showBottomSheet(
    BuildContext context,
    String? header,
    List<String> options,
  ) {
    showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 23),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                header!,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF120D26)),
              ),
              SizedBox(height: 5),
              Divider(color: Color(0xFFC8D1E5)),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('assets/images/Group 1000003847.png'),
                ],
              ),
              SizedBox(height: 13),
              Row(
                children: [
                  Expanded(
                      child:
                          CustomTextField(header: 'Price', hintText: '00.00')),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CustomTextField(
                          header: 'Quantity', hintText: '00.00')),
                ],
              ),
              SizedBox(height: 13),
              CustomDropdownField(
                header: 'Color',
                hintText: 'Green',
                options: options,
                value: selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
              ),
              SizedBox(height: 23),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle button press
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4FB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                              primary: Color(0xFF7D8CAC),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                          child: Text('Back'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        // Handle button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProductScreen21(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFFFC107),
                              Color(0xFFFF8205),
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              primary: Colors.white,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: Color(0xFF99A7C7),
            padding: EdgeInsets.symmetric(vertical: 23, horizontal: 23),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                        backgroundColor: Color(0xFF99A7C7),
                        color: Colors.white,
                        value: 0.45),
                    Text(
                      '3/4',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    )
                  ],
                ),
                // Circular progress indicator
                SizedBox(width: 20.0),
                Expanded(
                  child: Text(
                    'Variant, Price & Stock',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pricing',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xFF212121)),
                ),
                SizedBox(height: 15.0),
                CustomTextField(
                  header: 'Price',
                  prefixIcon: Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFF1F4FB),
                    ),
                    child: Center(
                      child: Text(
                        '\$',
                        style:
                            TextStyle(color: Color(0xFF7D8CAC), fontSize: 15),
                      ),
                    ),
                  ),
                  hintText: '00.00',
                ),
                SizedBox(height: 15.0),
                SizedBox(height: 15.0),
                CustomTextField(
                  header: 'Sale Price',
                  prefixIcon: Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFF1F4FB),
                    ),
                    child: Center(
                      child: Text(
                        '\$',
                        style:
                            TextStyle(color: Color(0xFF7D8CAC), fontSize: 15),
                      ),
                    ),
                  ),
                  hintText: '00.00',
                ),
                SizedBox(height: 15.0),
                Text(
                  'Color Variant',
                  style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context, 'Add Color Variant',
                        ['Black', 'Yellow', 'green']);
                  },
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFC8D1E5))),
                      child: Text(
                        '+ Add option for colors',
                        style: TextStyle(
                            color: Color(0xFFFF9200),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Size Variant',
                  style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context, 'Add Size Variant',
                        ['Small', 'Yellow', 'Large']);
                  },
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFC8D1E5))),
                      child: Text(
                        '+ Add option for colors',
                        style: TextStyle(
                            color: Color(0xFFFF9200),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )),
                ),
                SizedBox(height: 36.0),
                Text(
                  'Stock',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212121),
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  header: 'Quantity',
                  hintText: '00.00',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Handle button press
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4FB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: null,
                            style: TextButton.styleFrom(
                                primary: Color(0xFF7D8CAC),
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16)),
                            child: Text('Back'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          // Handle button press
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFFC107),
                                Color(0xFFFF8205),
                              ],
                            ),
                          ),
                          child: TextButton(
                            onPressed: null,
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                primary: Colors.white,
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Text(
                                'Save & Continue',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class IconRow extends StatefulWidget {
  @override
  _IconRowState createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildContainer(Icons.format_bold, 0),
        buildContainer(Icons.format_italic, 1),
        buildContainer(Icons.format_underline, 2),
        buildContainer(Icons.attach_file, 3),
        buildContainer(Icons.format_list_bulleted, 4),
      ],
    );
  }

  Widget buildContainer(IconData iconData, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isSelected ? Color(0xFF7D8CAC) : Color(0xFFF1F4FB),
        ),
        child: Icon(
          iconData,
          color: isSelected ? Colors.white : Color(0xFF7D8CAC),
          size: 18,
        ),
      ),
    );
  }
}
