import 'package:flutter/material.dart';
import 'package:vibetag/screens/page/setting/page_social_setting_2.dart';

import '../../register/reusabletext.dart';

class SocialSetting extends StatefulWidget {
  const SocialSetting({Key? key}) : super(key: key);

  @override
  State<SocialSetting> createState() => _SocialSettingState();
}

class _SocialSettingState extends State<SocialSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(

          children: [
            SizedBox(height: 10,),
            Row(
              children: [
               IconButton(onPressed: (){
                 Navigator.pop(context);
               }, icon:  Icon(Icons.arrow_back_outlined,color: Color(0xff000000),),),               Spacer(),
                ReusableText(
                  title: 'Social Settings',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff363D4C),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SocialSettingTwo(
                      )   ));
                    });
                  },
                  child: Container(
                    width: 56,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xffFDBA31),
                              Color(0xffFF9200),
                            ]
                        ),
                        borderRadius: BorderRadius.circular(26)
                    ),
                    child:Center(
                      child:  ReusableText(
                        title: 'Save',
                        size: 14,
                        weight: FontWeight.w700,
                        color: Color(0xffFFFFFF),
                      ),
                    ) ,
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            ReusableText(
              title: 'Facebook',
              size: 16,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Image(image: AssetImage("Asset/icons/settings/facebook.png"),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff485470)
                  ),
                  hintText: " https://www.facebook.com/topm...",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 15,),
            ReusableText(
              title: 'Twitter',
              size: 16,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Image(image: AssetImage("Asset/icons/settings/twitter.png"),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff485470)
                  ),
                  hintText: " https://www.twitter.com/topmov...",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 15,),
            ReusableText(
              title: 'Instagram',
              size: 16,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Image(image: AssetImage("Asset/icons/settings/instagram.png"),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff485470)
                  ),
                  hintText: " https://www.instagram.com/top...",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 15,),
            ReusableText(
              title: 'Discord',
              size: 16,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Image(image: AssetImage("Asset/icons/settings/discord.png"),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff485470)
                  ),
                  hintText: " https://www.discord.com//topm...",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 15,),
            ReusableText(
              title: 'Linkedin',
              size: 16,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Image(image: AssetImage("Asset/icons/settings/linkedin.png"),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff485470)
                  ),
                  hintText: " https://www.linkedin.com//topm...",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 15,),
            ReusableText(
              title: 'YouTube',
              size: 16,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Image(image: AssetImage("Asset/icons/settings/youtube.png"),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xffC8D1E5)
                      )
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff485470)
                  ),
                  hintText: " https://www.youtube.com//topm...",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xffC8D1E5)
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffC8D1E5)))),
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    ));
  }
}
