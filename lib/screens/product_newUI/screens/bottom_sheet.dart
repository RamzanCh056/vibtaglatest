import 'package:flutter/material.dart';

class BottomSheetDetail extends StatefulWidget {
  const BottomSheetDetail({Key? key}) : super(key: key);

  @override
  State<BottomSheetDetail> createState() => _BottomSheetDetailState();
}

class _BottomSheetDetailState extends State<BottomSheetDetail> {
  int colorIndex = 0;
  int sizeIndex = 0;
  int item = 0;
  final List<Color> color = [
    const Color(0xFFC8D1E5),
    const Color(0xFF000000),
    const Color(0xFF478DF5),
    const Color(0xFFFF7979),
    const Color(0xFF35FFDB),
    const Color(0xFFCC5FFF),
    const Color(0xFFFFD335),
  ];
  final List<String> sizeTitle = ["XXS", "XS", "S", "M", "L", "N"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: Colors.white),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 89,
                      width: 89,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/headphone.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Air Max Best Sound, Active Noise Cancellation Wireless Headphones",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "\$ 249.99",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFF27F12),
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              const Text(
                                "\$290.99",
                                style: TextStyle(
                                    color: Color(0xFF7D8CAC),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "-40%",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Color(0xFFC8D1E5),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Text(
                      "Color: ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const Text(
                      "Blue",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          colorIndex = index;
                        });
                      },
                      child: Container(
                        height: 38,
                        width: 38,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                                color: colorIndex == index
                                    ? Colors.black
                                    : Colors.transparent)),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color[index],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  color: Color(0xFFC8D1E5),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Size",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(6, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      sizeIndex = index;
                    });
                  },
                  child: Container(
                    width: 62,
                    height: 56,
                    margin: const EdgeInsets.only(left: 14),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 18),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: sizeIndex == index
                            ? Colors.black
                            : const Color(0xFFC8D1E5),
                      ),
                    ),
                    child: Text(
                      sizeTitle[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: sizeIndex == index
                            ? Colors.black
                            : const Color(0xFFC8D1E5),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Color(0xFFC8D1E5),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Quantity",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const Text(
                      "Only 05 item left",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7D8CAC),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 43,
                  width: 185,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFFC8D1E5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (item > 0) {
                            setState(() {
                              item -= 1;
                            });
                          }
                        },
                        child: Container(
                          width: 44,
                          height: 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFC8D1E5),
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        item.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF485470),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            item += 1;
                          });
                        },
                        child: Container(
                          width: 44,
                          height: 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFC8D1E5),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  color: Color(0xFFC8D1E5),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xFFF1F4FB),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF7D8CAC),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFFFF9200),
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
