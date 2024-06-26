import 'package:flutter/material.dart';

import '../../utills/colors.dart';
import '../../widgets/smalltext.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final String route;
  final Color? color;
  const CustomFloatingActionButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.route,
      this.color});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.route);
      },
      child: Text.rich(
        textWidthBasis: TextWidthBasis.longestLine,
        TextSpan(
          children: [
            WidgetSpan(
              child: SizedBox(
                width: 100,
                height: 30,
                child: Center(
                  child: Card(
                    color: Colors.green[400],
                    child: Center(
                      child: SmallText(
                        text: widget.title,
                        color: whitecolor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const WidgetSpan(
              child: SizedBox(
                width: 10,
              ),
            ),
            WidgetSpan(
              child: CircleAvatar(
                backgroundColor: Colors.green[400],
                child: Icon(color: whitecolor, size: 26, widget.icon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
