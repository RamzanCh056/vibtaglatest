import 'package:flutter/material.dart';


import 'add_product_done.dart';
import 'add_product_screen.dart';

class AddProductScreen4 extends StatefulWidget {
  @override
  State<AddProductScreen4> createState() => _AddProductScreen4State();
}

class _AddProductScreen4State extends State<AddProductScreen4> {
  String? selectedCategory;
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
                      '4/4',
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
                    'Service & Waranty',
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
                  'Service',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xFF212121)),
                ),
                SizedBox(height: 15.0),
                CustomDropdownField(
                  header: 'Warranty',
                  hintText: 'Select',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 15.0),
                CustomDropdownField(
                  header: 'Warranty',
                  hintText: 'Select',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 25.0),
                Text(
                  'Delivery',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xFF212121)),
                ),
                SizedBox(height: 15.0),
                CustomDropdownField(
                  header: 'Standard Delivery',
                  hintText: 'Select',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 15.0),
                CustomDropdownField(
                  header: 'Express Delivery',
                  hintText: 'Select',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 12.0),
                CustomDropdownField(
                  header: 'Express Delivery',
                  hintText: 'Select',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 12.0),
                CustomDropdownField(
                  header: 'Package Weight',
                  hintText: 'Select',
                  showWg: true,
                  wgText: 'Kg',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 22.0),
                Text(
                  'Delivery',
                  style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12.0),
                CustomDropdownField(
                  header: 'Length',
                  hintText: '00.0',
                  showWg: true,
                  wgText: 'cm',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 12.0),
                CustomDropdownField(
                  header: 'Width',
                  hintText: '00.0',
                  showWg: true,
                  wgText: 'cm',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 12.0),
                CustomDropdownField(
                  header: 'Length',
                  hintText: '00.0',
                  showWg: true,
                  wgText: 'cm',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 12.0),
                CustomDropdownField(
                  header: 'Height',
                  hintText: '00.0',
                  showWg: true,
                  wgText: 'cm',
                  options: ['Yellow', 'Green', 'Black'],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProductDone(),
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
