// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/home/comment/widget/reacted_users_widget.dart';

import '../../../../utils/constant.dart';

class ReactedUsers extends StatefulWidget {
  final List<dynamic> users;
  const ReactedUsers({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  State<ReactedUsers> createState() => _ReactedUsersState();
}

class _ReactedUsersState extends State<ReactedUsers> {
  List<Widget> users = [];
  @override
  void initState() {
    super.initState();
    setUsers();
  }

  setUsers() {
    for (var user in widget.users) {
      users.add(ReactedUserWidget(user: user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height - 45,
        decoration: BoxDecoration(
          color: grayLight,
          boxShadow: lightShadow,
          borderRadius: radiusOnly(
            topLeft: 10,
            topRight: 10,
          ),
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                padding: spacing(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        pop(context);
                      },
                      child: Icon(Icons.arrow_back_rounded),
                    ),
                    Text(
                      'All Reactions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    gap(w: width * 0.2),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: users,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
