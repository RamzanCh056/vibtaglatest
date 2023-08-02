import 'package:flutter/material.dart';
import 'package:vibetag/screens/cart_mobile/reusable_cart.dart';
import 'package:vibetag/screens/movie/movie_screen.dart';
import '../register/reusabletext.dart';

class CartMobileScreen extends StatefulWidget {
  const CartMobileScreen({Key? key}) : super(key: key);

  @override
  State<CartMobileScreen> createState() => _CartMobileScreenState();
}

class _CartMobileScreenState extends State<CartMobileScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xffF1F4FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        leading:  IconButton(icon:(const Icon(Icons.arrow_back_outlined,color: Color(0xff000000),)), onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },),
        title:    const Center(child: ReusableText(title: 'My Cart',size: 16,weight: FontWeight.w700,color: Color(0xff222222),)),
        actions: const[
           Center(child: ReusableText(title: 'Delete   ',size: 14,weight: FontWeight.w500,color: Color(0xff485470),)),
        ],
      ),

      body: ListView
      (
      children: [
        const SizedBox(height: 6,),
        const ReusableCart(imageRequired: "Asset/images/cart/C1.png",),
        const SizedBox(height: 6,),
        const ReusableCart(imageRequired: "Asset/images/cart/C2.png",),
        const SizedBox(height: 6,),
        const ReusableCart(imageRequired: "Asset/images/cart/C3.png",),
        const SizedBox(height: 6,),
        const ReusableCart(imageRequired: "Asset/images/cart/C4.png",),
        const SizedBox(height: 6,),
        const ReusableCart(imageRequired: "Asset/images/cart/5.png",),
        const SizedBox(height: 6,),
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xffFFFFFF),
          child:  TextField(
            style: const TextStyle(color: Color(0xffC8D1E5)),
            decoration: InputDecoration(
                suffixIcon: Container(
                  height: 56,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffFF9200))
                  ),
                  child: const Center(
                    child: ReusableText(title: 'Apply',size: 14,weight: FontWeight.w600,color: Color(0xffFF9200),) ,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffC8D1E5))),
                hintText: "dd/mm/yy",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffC8D1E5))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color:Color(0xffC8D1E5)))),
          ),
        ),
        const SizedBox(height: 6,),
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xffF1F4Fa),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage(
                "Asset/images/cart/Deliver.png"
              ),),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  ReusableText(title: 'Delivery Fee',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                  SizedBox(height: 10,),
                  ReusableText(title: '\$5.00',size: 14,weight: FontWeight.w700,color: Color(0xff212121),),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffF8F9FB),
                  border: Border.all(color: const Color(0xffC8D1E5),
                  )
                ),
                child: Row(
                  children:const [
                    ReusableText(title: 'Standard',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                    SizedBox(width: 20,),
                    Icon(Icons.keyboard_arrow_down_sharp,color: Color(0xff485470),)
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 3,),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  ReusableText(title: 'Total',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                  SizedBox(height: 10,),
                  ReusableText(title: '\$546.00',size: 15,weight: FontWeight.w700,color: Color(0xffFF9200),),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffFF9200),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: ReusableText(title: 'Proceed to pay',size: 13,weight: FontWeight.w700,color: Color(0xffFFFFFF),),
                  ),
                ),
              ),
            ],
          ),
        ),


      ],
    ),));
  }
}
