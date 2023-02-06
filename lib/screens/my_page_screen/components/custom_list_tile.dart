import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomListTile extends StatelessWidget {
  final String? title;
  final String? likeImage;
  final String? likeTitle;
  final String? carImage;
  final String? carTitle;
  final String? circularImage;
  final Widget ? child;

  const CustomListTile({
    Key? key,
    this.title,
    this.likeImage,
    this.likeTitle,
    this.carImage,
    this.circularImage,
    this.carTitle, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: NetworkImage(circularImage!),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    likeImage!,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 5),
                  Text(likeTitle!),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    carImage!,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 5),
                  Text(carTitle!),
                ],
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF2196F3),
              shape: BoxShape.circle,
            ),
            child: child!,
          ),
        ],
      ),
    );
  }
}