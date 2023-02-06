import 'package:flutter/material.dart';
class MyArticleCard extends StatefulWidget {
  const MyArticleCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MyArticleCard> createState() => _MyArticleCardState();
}

class _MyArticleCardState extends State<MyArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cars and Love",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Cars and Love",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "38 views",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "10 August 2022",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Edit"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () {},
                child: Text("Edit"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}