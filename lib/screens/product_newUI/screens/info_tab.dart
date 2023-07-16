import 'package:flutter/material.dart';

import '../common/reusable-card.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          shrinkWrap: true,
          children: [
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
              height: 30,
            ),
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
      ),
    );
  }
}
