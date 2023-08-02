import 'package:flutter/material.dart';

import '../register/reusabletext.dart';

class ReusableListTile extends StatelessWidget {
  const ReusableListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        ListTile(
          leading: Image(image: AssetImage("Asset/images/blog/Rectangle 23850 (1).png")),
          title: Row(
            children: [
              Container(
                width: 102,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffFF9200).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),

                ),
                child: Center(
                  child: ReusableText(
                    title: 'Entertainment',
                    size: 12,
                    weight: FontWeight.w500,
                    color: Color(0xffFF9200),
                  ),
                ),
              ),
              Spacer(),
              ReusableText(
                title: '1hr ago',
                size: 12,
                weight: FontWeight.w500,
                color: Color(0xff7D8CAC),
              ),
            ],
          ),
          subtitle:  ReusableText(
            title: 'Govt schedules All Parties for the\nConference for February...',
            size: 14,
            weight: FontWeight.w700,
            color: Color(0xff212121),
          ),
        ),
        SizedBox(height: 10,),
        Divider(thickness: 2,height: 2,color: Color(0xffF1F4FB),),
        SizedBox(height: 10,),
        Row(

          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("Asset/images/blog/Group 76754.png")),
            SizedBox(width:   10,),
            ReusableText(
              title: 'BBC News',
              size: 13,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            Spacer(),
            Icon(Icons.more_horiz,color: Color(0xffC8D1E5),)
          ],
        ),

      ],
    );
  }
}
