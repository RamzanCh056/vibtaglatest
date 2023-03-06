import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../shop/drop_down_list.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              accountName: Text(
                " preferences?.getString('Email') ?? 'User'",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                '',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
      
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

}
