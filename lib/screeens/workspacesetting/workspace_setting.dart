import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../visibility/board_visibility.dart';
import '../../utills/colors.dart';

class WorkspaceSettings extends StatefulWidget {
  const WorkspaceSettings({super.key});

  @override
  State<WorkspaceSettings> createState() => _WorkspaceSettingsState();
}

class _WorkspaceSettingsState extends State<WorkspaceSettings> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = "Muhammad Younis Workspace";
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(
          text: "Workspace settings",
          fontSize: 22,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.black12,
            leading: const SmallText(text: "Name"),
            trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: EditableText(
                  textAlign: TextAlign.end,
                  controller: nameController,
                  focusNode: FocusNode(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                  cursorColor: Colors.black54,
                  backgroundCursorColor: brandColor,
                  onSubmitted: (value) {
                    Navigator.pop(context);
                  },
                )),
          ),
          const SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Colors.black12,
            leading: const SmallText(text: "Visibility"),
            trailing: GestureDetector(
              child: const SmallText(text: "Public"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const BoardVisibility();
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SmallText(text: "Not all settings are editable on mobile"),
            ),
          )
        ],
      ),
    );
  }
}
