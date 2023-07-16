import 'package:flutter/material.dart';

import '../common/reusable-card.dart';


class RatingAndReview extends StatelessWidget {
  const RatingAndReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 10,),
          const ReusableCard(title: "Positive Seller", value: "70%"),
          const SizedBox(height: 10,),
          const ReusableCard(title: "Ship on Time", value: "91%"),
          const SizedBox(height: 10,),
          const ReusableCard(title: "Positive Seller", value: "100%"),
          const SizedBox(height: 20,),
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
                            children: const [
                              Text(
                                "Mark Henry",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFBE5C),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
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
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
