import 'package:flutter/material.dart';
import 'package:vibetag/screens/header/header.dart';

import '../../../widgets/navbar.dart';
import '../common/reusable-card.dart';

class Screen77 extends StatelessWidget {
  const Screen77({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                NavBar(),
                Header(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/headphone.jpg",
                  fit: BoxFit.cover,
                  height: 230,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 280),
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(17),
                ),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  const Text(
                    "Air Max Best Sound Quality Active Noise Cancellation Wireless Headphones",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                color: Color(0xFFFFB13D),
                              )),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("33 Reviews"),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Color(0xFFC8D1E5),
                  ),
                  const Text(
                    "\$ 249.99",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF27F12),
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: const [
                      Text(
                        "\$290.99",
                        style: TextStyle(
                            color: Color(0xFF7D8CAC),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "-40%",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFC8D1E5),
                  ),
                  const Text(
                    "More Info",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFF8F9FB),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Standard Delivery",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF485470),
                              ),
                            ),
                            Text(
                              "10-15 Days",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF485470),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          color: Color(0xFFC8D1E5),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Standard Delivery",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF485470),
                              ),
                            ),
                            Text(
                              "10-15 Days",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF485470),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ReusableCard(
                    title: 'Refundable',
                    value: "7 Days Returns",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ReusableCard(
                    title: 'Brand',
                    value: "Audionic",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ReusableCard(
                    title: 'Type',
                    value: "New",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ReusableCard(
                    title: 'Model Number',
                    value: "DE34-3DD2",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ReusableCard(
                    title: 'Stock',
                    value: "450",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ReusableCard(
                    title: 'Material',
                    value: "Plastic ",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Divider(
                    color: Color(0xFFC8D1E5),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Product Detail",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/im 1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white])),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFFFF9200),
                            )),
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF9200),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Color(0xFFC8D1E5),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "About Seller",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xFFD9D9D9),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Mark Henry",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Design your Future Today with us",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Row(children: [
                            ...List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Color(0xFFFF9200),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "5",
                              style: TextStyle(
                                color: Color(0xFFFF9200),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "(241)",
                              style: TextStyle(
                                color: Color(0xFF485470),
                              ),
                            ),
                          ])
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFFC8D1E5),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Likes",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF485470),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "20k+",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFFC8D1E5),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Products",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF485470),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "7k+",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFFC8D1E5),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Reaction",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF485470),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "310k+",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFFC8D1E5),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Product Sold",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF485470),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "52",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Color(0xFFC8D1E5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "About Seller",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        "4.9",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "(36 Reviews)",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF485470),
                        ),
                      ),
                      const Spacer(),
                      ...List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Color(0xFFFFB13D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ReusableCard(title: "Positive Seller", value: "70%"),
                  const SizedBox(
                    height: 11,
                  ),
                  const ReusableCard(title: "Positive Seller", value: "70%"),
                  const SizedBox(
                    height: 11,
                  ),
                  const ReusableCard(title: "Positive Seller", value: "100%"),
                  const SizedBox(
                    height: 11,
                  ),
                  const ReusableCard(title: "Positive Seller", value: "70%"),
                  const SizedBox(
                    height: 15,
                  ),
                  ...List.generate(3, (index) {
                    return Container(
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFC8D1E5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xFFD9D9D9),
                                child: Text(
                                  "M",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Mark Henry",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFBE5C),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "5.0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF485470),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/AU - Australia.png"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Australia",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF485470),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "I'm glad that I found such a wonderful designer. His imagination allowed him to realize ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF485470),
                            ),
                          )
                        ],
                      ),
                    );
                  }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0xFFFF9200),
                            )),
                        child: const Text(
                          "Load more",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF9200),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
