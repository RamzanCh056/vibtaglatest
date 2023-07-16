// custom button class
import 'package:flutter/material.dart';



class CustButton extends StatelessWidget {
  const CustButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.width,
    this.color,
    this.textColor,
    this.isHollow = false,
    this.args,
    this.outline,
    this.reverseColor,
    this.hollowColor,
    this.fontSize,
    this.height
  }) : super(key: key);
  final void Function()? onTap;
  final String? title;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? hollowColor;
  final bool isHollow;
  final Map<String, String>? args;

  final double? outline;
  final double? reverseColor;
  final double? fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: color != null
              ? color
              : isHollow
              ? Colors.transparent
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(outline ?? 25),
          border: Border.all(
            color: isHollow
                ? hollowColor ?? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
          ),
        ),
        child: Center(
          // TODO: Button Translation
          // child: TrnsText(
          //    title: title!,
          // args: args,

          child: Text(title!,
              style: TextStyle(
                  fontSize: fontSize ?? 16,
                  color: textColor != null
                      ? textColor
                      : isHollow
                      ? hollowColor ??
                      Theme.of(context).colorScheme.secondary
                      : Theme.of(context).textTheme.bodyText1!.color)),
        ),
      ),
    );
  }
}