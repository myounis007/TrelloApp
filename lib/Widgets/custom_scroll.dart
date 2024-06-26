import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  final Widget child;

  const CustomScrollbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: child,
      // Customize your scrollbar properties here
    );
  }
}
