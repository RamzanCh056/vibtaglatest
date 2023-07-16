import 'package:flutter/material.dart';

class AddProductDone extends StatelessWidget {
  const AddProductDone({Key? key}) : super(key: key);

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
      body: Column(children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 23),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                      backgroundColor: Color(0xFF99A7C7),
                      color: Color(0xFFFF9200),
                      value: 1),
                  Text(
                    '4/4',
                    style: TextStyle(
                        color: Color(0xFFFF9200),
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  )
                ],
              ),
              // Circular progress indicator
              SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  'Success',
                  style: TextStyle(
                      color: Color(0xFFFF9200),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Image.asset('assets/images/Group 23.png'),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Product Successfully Added',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFFFF9200),
              fontSize: 19),
        ),
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  'Save & Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
