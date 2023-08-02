import 'package:flutter/material.dart';

import '../register/reusabletext.dart';

class GridViewRepeatProduct extends StatefulWidget {
  const GridViewRepeatProduct({Key? key}) : super(key: key);

  @override
  State<GridViewRepeatProduct> createState() => _GridViewRepeatProductState();
}

class _GridViewRepeatProductState extends State<GridViewRepeatProduct> {
  final List<String> items = [
    'Asset/images/productTrend/Rectangle 24149.png',
    'Asset/images/productTrend/Rectangle 24149 (1).png',
    'Asset/images/productTrend/Rectangle 24149 (2).png',
    'Asset/images/productTrend/Rectangle 24149 (3).png',
    'Asset/images/productTrend/Rectangle 24149 (4).png',
    'Asset/images/productTrend/Rectangle 24149 (2).png'

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.7,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffF1F4FB),
          borderRadius: BorderRadius.circular(10)
      ),
      child:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisSpacing: 1,mainAxisSpacing:1,
          crossAxisCount: 2, // Two items per row
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffFFFFFF)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                    fit: BoxFit.cover,
                    image: AssetImage( items[index],)),
                SizedBox(height: 10,),

                ReusableText(title: 'Air Max Best Sound\nQuality Active...',size: 13,weight: FontWeight.w600,color: Color(0xff000000),),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.star,color: Color(0xffFFB13D),),
                  Icon(Icons.star,color: Color(0xffFFB13D),),
                  Icon(Icons.star,color: Color(0xffFFB13D),),
                  Icon(Icons.star,color: Color(0xffFFB13D),),
                  Icon(Icons.star,color: Color(0xffFFB13D),),
                  ReusableText(title: '(33)',size: 10,weight: FontWeight.w500,color: Color(0xff485470),),
                ],),
                SizedBox(height: 10,),
                RichText(text: TextSpan(
                    text: '\$ 249.99 ',
                    style: TextStyle(
                      color: Color(0xffF27F12),
                      fontWeight: FontWeight.w700,
                      fontSize: 15,

                    ),
                    children: [
                      TextSpan(
                        text: '\n\$ 2.00  -53%',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xff7D8CAC),
                            fontWeight: FontWeight.w500,
                            fontSize: 10
                        ),
                      )
                    ]
                ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}