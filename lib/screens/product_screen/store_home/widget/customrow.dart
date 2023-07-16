import 'package:flutter/material.dart';
class CustomRow extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  const CustomRow({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title!,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              InkWell(
                  onTap: onTap,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),),

            ],
          ),
          Divider(color: Color(0xFF707070),),
        ],
      ),
    );
  }
}