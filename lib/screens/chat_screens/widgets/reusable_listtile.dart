import 'package:flutter/material.dart';
class ReusableListTile extends StatelessWidget {
  final VoidCallback? handler;
  final String? title;
  final String? image;

  const ReusableListTile({
    Key? key,
    this.handler,
    this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: Card(
        elevation: 0,
        color: const Color(0xFFF1F4FB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
          leading: Image.asset(image!),
          title: Text(
            title!,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ),
    );
  }
}