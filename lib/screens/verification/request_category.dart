import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vibetag/screens/register/reusabletext.dart';
import 'package:vibetag/screens/verification/request_link.dart';



class RequestCategory extends StatefulWidget {
  const RequestCategory({Key? key}) : super(key: key);

  @override
  State<RequestCategory> createState() => _RequestCategoryState();
}

class _RequestCategoryState extends State<RequestCategory> {
  bool _isChecked = false;
  bool _isChecked11 = false;
  bool _isChecked22= false;
  bool _isChecked33= false;
  bool _isChecked44 = false;
  bool _isChecked55= false;
  bool _isChecked66= false;
  bool _isChecked77= false;
  bool _isChecked88= false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(

          children: [
            Row(
              children: [
                IconButton(icon:(Icon(Icons.arrow_back_outlined,color: Color(0xff000000),)), onPressed: () {
                  setState(() {

                    Navigator.pop(context);
                  });
                },),
                Spacer(),
                ReusableText(title: 'Request Verification',size: 16,weight: FontWeight.w700,color: Color(0xff222222),),
                Spacer(),
              ],
            ),
            SizedBox(height: 10,),
            LinearProgressBar(
              maxSteps: 3,
              minHeight: 3,
              progressType: LinearProgressBar
                  .progressTypeLinear, // Use Linear progress
              currentStep: 2,
              progressColor: const Color(0xffFF9200),
              backgroundColor: const Color(0xff99A7C7),
            ),
            SizedBox(height: 15,),
            ReusableText(title: 'Step 2',size: 13,weight: FontWeight.w600,color: Color(0xffFF9200),),
            SizedBox(height: 15,),
            ReusableText(title: 'Confirm Notability',size: 18,weight: FontWeight.w700,color: Color(0xff212121),),
            SizedBox(height: 10,),
            ReusableText(title: 'Show that the publics figure, celebrity or brand your\naccount represents is in the public interest',size: 12,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
            SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                suffixIcon: IconButton(icon:Icon(Icons.keyboard_arrow_down,color: Color(0xff99A7C7),),
                  onPressed: (){
                    setState(() {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        backgroundColor:const Color(0xffFFFFFF),
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder:
                              (BuildContext context,
                              void Function(void Function()) setState) {
                            return Container(
                              height: MediaQuery.of(context).size.height*0.8,
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                                    child: Row(
                                      children: [
                                        ReusableText(title: 'Cancel',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                                        Spacer(),
                                        ReusableText(title: 'Document Type',size: 16,weight: FontWeight.w700,color: Color(0xff222222),),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(0xffFF9200)
                                          ),
                                          child:  Center(child: ReusableText(title: 'Save',size: 13,weight: FontWeight.w500,color: Color(0xffFFFFFF),)),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(thickness: 6,height: 6,color: Color(0xffF1F4FB),),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked = value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'News/Media',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked11,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked11 = value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Sports',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked22,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked22 = value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Government and Politics',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked33,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked33 = value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Music',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked44,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked44= value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Entertainment',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked55,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked55= value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Digital Creator/Blogger',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked66,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked66= value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Gamer',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked77,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked77 = value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Treveler',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height: 56,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(color: Color(0xffE0E6F3))
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _isChecked88,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked88= value!;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(color: Color(0xffC8D1E5)),
                                                ),
                                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return Color(0xFFFF9200);
                                                  }
                                                  return Color(0xffC8D1E5);
                                                }),
                                              ),
                                              ReusableText(title: 'Other',size: 16,weight: FontWeight.w600,color: Color(0xff212121),),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        },
                      );
                    });
                  },
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color(0xffC8D1E5)
                    )
                ),
                hintText: "Category",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffC8D1E5),
                    )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xffC8D1E5),),),),
            ),

            SizedBox(height: 10,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintText: "Audience (optional)",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 10,),
            ReusableText(title: 'Who follows you, why, and their interests',size: 12,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
            SizedBox(height: 10,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintText: "Also known as (optional)",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 10,),
            ReusableText(title: 'List all names associated with your account, including\ndifferent names and names in other languages',size: 12,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
            SizedBox(height: 10,),
SizedBox(height: 240,),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,width: MediaQuery.of(context).size.width*0.46,
                    decoration: BoxDecoration(

                        color: const Color(0xffF1F4FB),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: ReusableText(
                        title: "Back",
                        color: Color(0xff485470),
                        weight: FontWeight.w800,
                        size: 17,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestLink()));
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.46,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xffFFC107),
                          Color(0xffFF8205),
                        ]),
                        color: const Color(0xffCCCCCC),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: ReusableText(
                        title: "Next",
                        color: Colors.white,
                        weight: FontWeight.w800,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    ));
  }
}
