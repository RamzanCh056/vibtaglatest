import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constant.dart';

Widget NewInputField({
  required String hintText,
  String prefixIcon = '',
  String suffexIcon = '',
  String chageIcon = '',
  required TextEditingController controller,
  bool isObscure = false,
  bool isSvgIcons = false,
}) {
  bool toggleObscure = isObscure;
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return Container(
        height: 40,
        child: Stack(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: lightblue,
                ),
                contentPadding: const EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: lightGrayNew,
                  ),
                  borderRadius: borderRadius(12),
                ),
                prefix: prefixIcon != ''
                    ? Container(
                        width: 40,
                        height: 20,
                      )
                    : Container(
                        width: 10,
                        height: 20,
                      ),
              ),
              obscureText: isObscure,
            ),
            prefixIcon != ''
                ? Positioned(
                    top: 10,
                    left: 15,
                    child: Container(
                      child: isSvgIcons
                          ? SvgPicture.asset(
                              prefixIcon,
                              color: grayMed,
                            )
                          : Image.asset(
                              prefixIcon,
                              color: grayMed,
                            ),
                    ),
                  )
                : SizedBox(),
            suffexIcon != ''
                ? Positioned(
                    top: 10,
                    right: 15,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          toggleObscure = !toggleObscure;
                          isObscure = toggleObscure;
                        });
                      },
                      child: Container(
                        child: isSvgIcons
                            ? toggleObscure
                                ? SvgPicture.asset(
                                    suffexIcon,
                                    color: grayMed,
                                  )
                                : SvgPicture.asset(
                                    chageIcon,
                                    color: grayMed,
                                  )
                            : toggleObscure
                                ? Image.asset(
                                    suffexIcon,
                                    color: grayMed,
                                  )
                                : Image.asset(
                                    chageIcon,
                                    color: grayMed,
                                  ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      );
    },
  );
}
