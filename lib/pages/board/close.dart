import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/custombutton.dart';

import '../../utills/colors.dart';

class CloseBoard extends StatefulWidget {
  const CloseBoard({super.key});

  @override
  State<CloseBoard> createState() => _CloseBoardState();
}

class _CloseBoardState extends State<CloseBoard> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Board 1 is now closed."),
      content: SizedBox(
        height: 110,
        child: Column(
          children: [
            SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomButton(
                    color: Colors.blue[700],
                    text: 'Re-Open',
                    onPressed: () {
                      Navigator.pop(context);
                    })),
            SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomButton(
                    textStyle: const TextStyle(color: Colors.red),
                    color: whitecolor,
                    text: 'Delete',
                    onPressed: () {
                      Navigator.pop(context);
                    })),
          ],
        ),
      ),
    );
  }
}
