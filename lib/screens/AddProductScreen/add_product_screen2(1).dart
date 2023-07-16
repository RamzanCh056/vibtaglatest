import 'package:flutter/material.dart';


import 'add_android_screen4.dart';
import 'add_product_screen.dart';
import 'add_product_screen3.dart';

class AddProductScreen21 extends StatefulWidget {
  @override
  State<AddProductScreen21> createState() => _AddProductScreen21State();
}

class _AddProductScreen21State extends State<AddProductScreen21> {
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
                CustomContainer(
                  title: 'Brown',
                  qty: '80',
                  dollarValue: '\$50',
                ),
                CustomContainer(
                  title: 'Black',
                  qty: '20',
                  dollarValue: '\$100',
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
                CustomContainer(
                  title: 'Brown',
                  qty: '80',
                  dollarValue: '\$50',
                ),
                CustomContainer(
                  title: 'Black',
                  qty: '20',
                  dollarValue: '\$100',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProductScreen4(),
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

class CustomContainer extends StatefulWidget {
  final String title;
  final String qty;
  final String dollarValue;

  const CustomContainer({
    required this.title,
    required this.qty,
    required this.dollarValue,
  });

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFC8D1E5)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
            SizedBox(width: 5),
            ImageWidget(image: 'assets/images/Rectangle 24093.png'),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      'QTY: ${widget.qty}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF7D8CAC)),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '⨀',
                      style: TextStyle(
                        color: Color(0xFFC8D1E5),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${widget.dollarValue}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF7D8CAC)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String? image;

  const ImageWidget({super.key, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image!)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue, // Replace with your network image
      ),
    );
  }
}
