import 'package:flutter/material.dart';

import '../register/reusabletext.dart';


class ReusableCart extends StatefulWidget {

  final String imageRequired;

  const ReusableCart({Key? key, required this.imageRequired}) : super(key: key);

  @override
  State<ReusableCart> createState() => _ReusableCartState();
}

class _ReusableCartState extends State<ReusableCart> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color(0xffFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: AssetImage(widget.imageRequired)),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(title: 'New stylish black printed t-sh...',size: 14,weight: FontWeight.w600,color: Color(0xff212121),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    RichText(text: TextSpan(
                        text: 'Color: ',
                        style: TextStyle(
                            color: Color(0xff7D8CAC),
                            fontWeight: FontWeight.w500,
                            fontSize: 12
                        ),
                        children: [
                          TextSpan(
                            text: 'Black',
                            style: TextStyle(
                                color: Color(0xff485470),
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            ),
                          )
                        ]
                    ),

                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 5,width: 5,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff99A7C7),
                    ),
                    ),
                    SizedBox(width: 20,),
                    RichText(text: TextSpan(
                        text: 'Size: ',
                        style: TextStyle(
                            color: Color(0xff7D8CAC),
                            fontWeight: FontWeight.w500,
                            fontSize: 12
                        ),
                        children: [
                          TextSpan(
                            text: 'large',
                            style: TextStyle(
                                color: Color(0xff485470),
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            ),
                          )
                        ]
                    ),

                    ),
                  ],
                ),
                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(title: '\$ 249.99',size: 14,weight: FontWeight.w700,color: Color(0xffF27F12),),
                        SizedBox(height: 6,),
                        RichText(text: TextSpan(
                            text: '\$290.99  ',
                            style: TextStyle(
                                color: Color(0xff7D8CAC),
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough
                            ),
                            children: [
                              TextSpan(
                                text: '-40 %',
                                style: TextStyle(
                                    color: Color(0xff485470),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12
                                ),
                              )
                            ]
                        ),
                        )
                      ],
                    ),
                    SizedBox(width: 60,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8D1E5)),
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:   Row(
                        children: [
                          InkWell(
                            onTap:(){
                              setState(() {
                                if(_currentValue!=0){
                                  _currentValue -= 1;
                                }
                                else{
                                  _currentValue=0;
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xffC8D1E5),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Icon(Icons.remove,color: Colors.white,),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:  Center(child: ReusableText(title: "$_currentValue",size: 14,weight: FontWeight.w600,color: Color(0xff212121),)),
                          ),
                          InkWell(
                            onTap:(){
                              setState(() {
                                _currentValue++;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xffC8D1E5),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Icon(Icons.add,color: Colors.white,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}
