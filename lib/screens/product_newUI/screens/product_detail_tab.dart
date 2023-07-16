import 'package:flutter/material.dart';
import 'package:vibetag/screens/product_newUI/screens/screen77.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Screen77() ));
                },
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset("assets/images/im 1.png",fit: BoxFit.cover,),
                ),
              ),
              SizedBox(height: 5,),
              SizedBox(
                width: double.infinity,
                child: Image.asset("assets/images/im 2.png",fit: BoxFit.cover,),
              ),
              SizedBox(height: 5,),
              SizedBox(
                width: double.infinity,
                child: Image.asset("assets/images/im 2.png",fit: BoxFit.cover,),
              ),
              SizedBox(height: 15,),

            ],
          ),
          Container(
            width: double.infinity,
            height: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12),),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF485470),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/chatting.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Chat",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFFF9200),
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFFFF9200),)
                    ),
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600,color: Color(0xFFFF9200),),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
