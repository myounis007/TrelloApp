import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final List<TextSpan> textSpans;
  final TextAlign textAlign;
  final TextStyle defaultTextStyle;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final SizedBox? space;
  

  const CustomRichText({super.key, 
    required this.textSpans,
    this.textAlign = TextAlign.start,
    this.defaultTextStyle = const TextStyle(color: Colors.black, fontSize: 16),
    this.padding = EdgeInsets.zero,
    this.color = Colors.white,  this.space,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
        
        textAlign: textAlign,
        text: TextSpan(

          style: TextStyle(color: color),
          children: textSpans,
        ),
        
      ),
    );
  }
}
