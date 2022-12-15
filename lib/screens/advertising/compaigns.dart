import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class Compaigns extends StatelessWidget {
  const Compaigns({super.key});

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width * 0.9,
            child: Card(
              elevation: 5,
              shadowColor: Color.fromARGB(71, 0, 0, 0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                height: height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Center(
                      child: Container(
                        padding: spacing(
                          horizontal: 7,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: orange,
                          borderRadius: borderRadius(
                            width * 0.1,
                          ),
                        ),
                        child: Icon(
                          Icons.file_copy,
                          color: white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Compaigns',
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Table(
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'ID',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Company',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Bidding',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Clicks',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Views',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '87',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Rafale_Desi..',
                            style: TextStyle(
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Views',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '40K',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '50K',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: Text(
                            'Approved',
                            style: TextStyle(
                              fontSize: 10,
                              color: green,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: Icon(
                            Icons.more_vert,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '87',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Rafale_Desi..',
                            style: TextStyle(
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Views',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '40K',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '50K',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: Text(
                            'Pending Approval',
                            style: TextStyle(
                              fontSize: 10,
                              color: red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: Icon(
                            Icons.more_vert,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '87',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Rafale_Desi..',
                            style: TextStyle(
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Views',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '40K',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Text(
                            '50K',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: Text(
                            'Approved',
                            style: TextStyle(
                              fontSize: 10,
                              color: green,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          child: const Icon(
                            Icons.more_vert,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                'Load more',
                style: TextStyle(
                  color: blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
