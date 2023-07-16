import 'package:flutter/material.dart';

class SalesItem extends StatelessWidget {
  final String? title;
  final String? button1Text;
  final String? button2Text;
  final String? price;
  final String? oldPrice;

  const SalesItem(
      {this.title,
        this.button1Text,
        this.button2Text,
        this.price,
        this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 230,
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width/2,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFE52F2F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "sale",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 90,
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              color: Color(0xFFEAEAEA),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    // Garden & pets Button
                    Container(
                      height: 27,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          button1Text!,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      price!,
                      style: TextStyle(
                          color: Color(0xFFFF9200),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    // Garden & pets Button
                    Container(
                      height: 27,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          button2Text!,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      oldPrice!,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}