import 'package:flutter/material.dart';


import 'add_product_screen 2.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
                      '1/4',
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
                    'Basic Information',
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
                  'Product Images and Video',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xFF212121)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Product Images',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF485470)),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Color(0xFF99A7C7),
                      ),
                      onPressed: () {
                        // Handle info icon press
                      },
                    ),
                  ],
                ),
                Text(
                  'Upload between 3 to 8 images',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF99A7C7)),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/Group 1000003847.png'),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(
                          'Cover Photo',
                          style: TextStyle(
                              color: Color(0xFF99A7C7),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/Group 1000003847.png'),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(
                          'Image 1',
                          style: TextStyle(
                              color: Color(0xFF99A7C7),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/Group 1000003847.png'),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(
                          'Image 3',
                          style: TextStyle(
                              color: Color(0xFF99A7C7),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                CustomTextField(
                    header: 'Video Link',
                    hintText: 'Input youtube video link here'),
                SizedBox(height: 12.0),
                Text(
                  'Product Images',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF485470)),
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
                CustomTextField(
                    header: 'Product title',
                    hintText: 'Full Spectrum Headphones'),
                SizedBox(height: 12.0),
                CustomTextField(header: 'Location', hintText: 'Type here'),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xFFC8D1E5),
                      width: 1.0,
                    ),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          onChanged: (newValue) {
                            // Handle checkbox state change
                          },
                          fillColor: MaterialStateProperty.all<Color>(
                            Color(0xFFFF9200),
                          ),
                        ),
                        Text('In-store selling only'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          onChanged: (newValue) {
                            // Handle checkbox state change
                          },
                          fillColor: MaterialStateProperty.all<Color>(
                            Color(0xFFFF9200),
                          ),
                        ),
                        Text('Online selling only'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          onChanged: (newValue) {
                            // Handle checkbox state change
                          },
                          fillColor: MaterialStateProperty.all<Color>(
                            Color(0xFFFF9200),
                          ),
                        ),
                        Text('Available both In-store and online'),
                      ],
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 22,
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
                CustomDropdownField(
                  header: 'Product Category',
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
                  height: 12,
                ),
                CustomDropdownField(
                  header: 'sub-category',
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
                Text(
                  'Condition & Model',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212121),
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomDropdownField(
                  header: 'Type Of Condition',
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
                  height: 12,
                ),
                CustomDropdownField(
                  header: 'Add model number',
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
                  height: 12,
                ),
                CustomDropdownField(
                  header: 'Brand',
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
                  height: 18,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProductScreen2(),
                            ),
                          );
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

// ONLY TEXTFIELD

class CustomTextField extends StatelessWidget {
  final String header;
  final String hintText;
  Widget? prefixIcon;
  int? maxLines;

  CustomTextField(
      {required this.header,
      required this.hintText,
      this.maxLines = 1,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF485470),
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              maxLines: maxLines,
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20, vertical: 16),
                prefixIcon: prefixIcon,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Color(0xFF99A7C7),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//DROPDOWN TEXTFIELD

class CustomDropdownField extends StatelessWidget {
  final String header;
  final String hintText;
  final List<String> options;
  final String? value;
  final ValueChanged<String?>? onChanged;
  bool showWg;
  String? wgText;

  CustomDropdownField({
    required this.header,
    required this.hintText,
    required this.options,
    required this.value,
    required this.onChanged,
    this.showWg = false,
    this.wgText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF485470),
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(
              icon: null,
              iconSize: 0,
              decoration: InputDecoration(
                iconColor: Colors.white,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showWg)
                      SizedBox(
                        height: 26,
                        child: VerticalDivider(
                          thickness: 1.5,
                          color: Color(0xFFC8D1E5),
                        ),
                      ),
                    const SizedBox(
                      width: 7,
                    ),
                    if (showWg)
                      Text(
                        wgText!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF485470),
                        ),
                      ),
                    const SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ],
                ),
                hintText: hintText,
                icon: null,
                hintStyle: TextStyle(
                    color: Color(0xFF99A7C7),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                border: InputBorder.none,
              ),
              value: value,
              onChanged: onChanged,
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
