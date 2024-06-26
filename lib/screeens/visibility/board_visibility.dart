import 'package:flutter/material.dart';
import 'package:trelloapps/utills/constants.dart';
import 'package:trelloapps/widgets/custombutton.dart';

class BoardVisibility extends StatefulWidget {
  const BoardVisibility({super.key});

  @override
  State<BoardVisibility> createState() => _BoardVisibilityState();
}

class _BoardVisibilityState extends State<BoardVisibility> {
  List<bool> checked = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text("Visibility"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: ListTile(
                leading: Checkbox(
                  value: checked[0],
                  onChanged: (bool? value) {},
                ),
                title: Text(visibilityConfigurations[0]["type"]!),
                subtitle: Text(visibilityConfigurations[0]["description"]!),
              ),
            ),
            Card(
              child: ListTile(
                leading: Checkbox(
                  value: checked[1],
                  onChanged: (bool? value) {},
                ),
                title: Text(visibilityConfigurations[1]["type"]!),
                subtitle: Text(visibilityConfigurations[1]["description"]!),
              ),
            ),
            Card(
              child: ListTile(
                leading: Checkbox(
                  value: checked[2],
                  onChanged: (bool? value) {},
                ),
                title: Text(visibilityConfigurations[2]["type"]!),
                subtitle: Text(visibilityConfigurations[2]["description"]!),
              ),
            )
          ],
        ),
        actions: [
          CustomButton(
              color: Colors.black38,
              text: 'Save',
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
