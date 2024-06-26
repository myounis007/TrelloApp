import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/smalltext.dart';

class ViewMembers extends StatefulWidget {
  const ViewMembers({super.key});

  @override
  State<ViewMembers> createState() => _ViewMembersState();
}

class _ViewMembersState extends State<ViewMembers> {
  List cardMembers = [
    {"name": "Muhammad younis", "handle": "@younis"}
  ];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SmallText(text: "Card Members"),
      content: SizedBox(
        height: 80,
        child: Column(children: buildWidgets()),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const SmallText(text: "DONE"))
      ],
    );
  }

  List<Widget> buildWidgets() {
    List<Widget> members = [];
    for (int i = 0; i < cardMembers.length; i++) {
      members.add(ListTile(
        leading: const CircleAvatar(),
        title: Text(cardMembers[i]["name"]),
        subtitle: Text(cardMembers[i]["handle"]),
      ));
    }
    return members;
  }
}
