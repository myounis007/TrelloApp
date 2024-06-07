import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final TextStyle? style;

  const HeadingText({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 25.0,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
    this.padding = EdgeInsets.zero,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        softWrap: true,
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
