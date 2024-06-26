import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/smalltext.dart';

class EditLabels extends StatefulWidget {
  const EditLabels({super.key});

  @override
  State<EditLabels> createState() => _EditLabelsState();
}

class _EditLabelsState extends State<EditLabels> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: AlertDialog(
        title: const SmallText(
          text: "Edit labels",
          fontSize: 20,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: buildWidget(),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const SmallText(
                    text: 'Done',
                    color: Colors.blue,
                  )),
              trailing: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const SmallText(
                    text: 'Create label',
                    color: Colors.blue,
                  )),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildWidget() {
    List<Widget> labelContainers = [];
    for (int i = 0; i < 8; i++) {
      labelContainers.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      );
    }
    return labelContainers;
  }
}
