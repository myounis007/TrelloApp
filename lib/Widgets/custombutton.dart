import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final TextStyle textStyle;
  final double borderRadius;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 18),
    this.borderRadius = 8.0,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
