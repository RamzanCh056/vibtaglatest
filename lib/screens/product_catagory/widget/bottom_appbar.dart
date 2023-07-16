import 'package:flutter/material.dart';

class BottomAppbar extends StatelessWidget {
  const BottomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          SizedBox(width: 5,),
          Container(
            width: 260,
            height: 60,
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 12),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.orangeAccent,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
