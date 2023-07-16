import 'package:flutter/material.dart';

class RightTable extends StatelessWidget {
  final String ? modelNo;
  final String ? amountOfStok;
  final String ? deliveryType;
  final String ? brand;
  final String ? returnable;
  const RightTable({this.modelNo, this.amountOfStok, this.deliveryType, this.brand, this.returnable});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: Border.all(color: Color(0xFFB4B4B4))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              modelNo!,
              style: TextStyle(fontSize: 16, color: Color(0xFF707070)),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            color: Color(0xFFEDEDED),
            child: Text(
              amountOfStok!,
              style: TextStyle(fontSize: 16, color: Color(0xFF707070)),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            color: Colors.white,
            child: Text(
              deliveryType!,
              style: TextStyle(fontSize: 16, color: Color(0xFF707070)),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            color: Color(0xFFEDEDED),
            child: Text(
              brand!,
              style: TextStyle(fontSize: 16, color: Color(0xFF707070)),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              returnable!,
              style: TextStyle(fontSize: 16, color: Color(0xFF707070)),
            ),
          ),
        ],
      ),
    );
  }
}