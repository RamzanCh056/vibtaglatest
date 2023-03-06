import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';

class NewSearchFilter extends StatefulWidget {
  const NewSearchFilter({super.key});

  @override
  State<NewSearchFilter> createState() => _NewSearchFilterState();
}

class _NewSearchFilterState extends State<NewSearchFilter> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width,
      color: white,
      padding: spacing(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gap(h: 15),
          Text(
            'Recent Search',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: grayMed,
              fontSize: 12,
            ),
          ),
          gap(h: 15),
          Container(
            margin: spacing(
              horizontal: 15,
            ),
            padding: spacing(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: grayMed,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 25,
                  child: Image.asset(
                    'assets/icons/search_history.png',
                    fit: BoxFit.cover,
                  ),
                ),
                gap(w: 10),
                Text(
                  'Avengers movie',
                  style: TextStyle(
                    fontSize: 12,
                    color: grayPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: spacing(
              horizontal: 15,
            ),
            padding: spacing(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: grayMed,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 25,
                  child: Image.asset(
                    'assets/icons/search_history.png',
                    fit: BoxFit.cover,
                  ),
                ),
                gap(w: 10),
                Text(
                  'New Cartoon movie 2022',
                  style: TextStyle(
                    fontSize: 12,
                    color: grayPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: spacing(
              horizontal: 15,
            ),
            padding: spacing(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: grayMed,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 25,
                  child: Image.asset(
                    'assets/icons/search_history.png',
                    fit: BoxFit.cover,
                  ),
                ),
                gap(w: 10),
                Text(
                  'Jumanji - 2 movie',
                  style: TextStyle(
                    fontSize: 12,
                    color: grayPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: spacing(
              horizontal: 15,
            ),
            padding: spacing(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: grayMed,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 25,
                  child: Image.asset(
                    'assets/icons/search_history.png',
                    fit: BoxFit.cover,
                  ),
                ),
                gap(w: 10),
                Text(
                  'Free Guy',
                  style: TextStyle(
                    fontSize: 12,
                    color: grayPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: spacing(
              horizontal: 15,
            ),
            padding: spacing(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: grayMed,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 25,
                  child: Image.asset(
                    'assets/icons/search_history.png',
                    fit: BoxFit.cover,
                  ),
                ),
                gap(w: 10),
                Text(
                  'Spider man -  No Way Home',
                  style: TextStyle(
                    fontSize: 12,
                    color: grayPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
