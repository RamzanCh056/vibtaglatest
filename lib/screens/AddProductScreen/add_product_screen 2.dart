import 'package:flutter/material.dart';

import 'add_product_screen.dart';
import 'add_product_screen3.dart';

class AddProductScreen2 extends StatefulWidget {
  @override
  State<AddProductScreen2> createState() => _AddProductScreen2State();
}

class _AddProductScreen2State extends State<AddProductScreen2> {
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
                      '2/4',
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
                    'Description & FAQ',
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
                  'Description',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xFF212121)),
                ),
                const SizedBox(
                  height: 15,
                ),
                IconRow(),
                SizedBox(height: 3.0),
                CustomTextField(
                  header: '',
                  hintText: 'type msgs here',
                  maxLines: 20,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Product Information',
                  style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12.0),
                Image.asset('assets/images/Group 76716.png'),
                SizedBox(height: 36.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FAQ's",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Handle button press
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFFF9200)),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFFFF9200)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      icon: Icon(Icons.add, color: Color(0xFFFF9200)),
                      label: Text(
                        "Add FAQ",
                        style: TextStyle(color: Color(0xFFFF9200)),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Category',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212121),
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  header: 'Question # 3',
                  hintText: 'Add a Question',
                ),
                CustomTextField(
                  header: '',
                  hintText: 'Add an Answer',
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomDropdownField(
                  header: 'Question # 1',
                  hintText: 'Select a category',
                  options: [
                    'Can we make order in your shop?',
                    'Option 2',
                    'Option 3'
                  ],
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomDropdownField(
                  header: 'Question # 1',
                  hintText: 'Select a category',
                  options: ['Option 1', 'Option 2', 'Option 3'],
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
                              builder: (context) => AddProductScreen3(),
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
