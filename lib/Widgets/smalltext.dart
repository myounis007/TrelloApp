import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final TextStyle? style;

  const SmallText({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.padding = EdgeInsets.zero,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
