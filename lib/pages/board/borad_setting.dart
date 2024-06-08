import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/headingtext.dart';
import 'package:trelloapps/Widgets/smalltext.dart';

import 'package:trelloapps/pages/board/close.dart';
import '../../Widgets/bluerectangle_square.dart';
import '../edit_labels.dart';
import '../../utills/colors.dart';

class BoardSettings extends StatefulWidget {
  const BoardSettings({super.key});

  @override
  State<BoardSettings> createState() => _BoardSettingsState();
}

class _BoardSettingsState extends State<BoardSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const HeadingText(
        text: "Board settings",
        fontSize: 25,
      )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            const BlueRectangle(),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                color: whiteShade,
                child: const ListTile(
                  leading: SmallText(text: "Name"),
                  trailing: SmallText(text: "Board 1"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: const ListTile(
                  leading: SmallText(text: "Workspace"),
                  trailing: SmallText(text: "Workspace 1"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const SmallText(text: "Background"),
                  // trailing: const ColorSquare(
                  //   bckgrd: "backgrounds[0]",
                  // ),
                  onTap: () {
                    // Navigator.pushNamed(context, "/boardbackground");
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const SmallText(text: "Enable card cover images"),
                  trailing: Switch(value: true, onChanged: ((value) {})),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                    leading: const SmallText(text: "Watch"),
                    trailing: Switch(value: false, onChanged: ((value) {}))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                    leading: const SmallText(text: "Available offline"),
                    trailing: Switch(value: false, onChanged: ((value) {}))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const SmallText(text: "Edit labels"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const EditLabels();
                        });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const SmallText(text: "Email-to-board settings"),
                  onTap: () {
                    // Navigator.pushNamed(context, "/emailtoboard");
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const SmallText(text: "Archived cards"),
                  onTap: () {
                    // Navigator.pushNamed(context, "/archivedcards");
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const SmallText(text: "Archived lists"),
                  onTap: () {
                    // Navigator.pushNamed(context, "/archivedlists");
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                color: whiteShade,
                child: const ListTile(
                  leading: SmallText(text: "Visibility"),
                  trailing: SmallText(text: "Public"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: const ListTile(
                  leading: SmallText(text: "Commenting"),
                  trailing: SmallText(text: "Members"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                color: whiteShade,
                child: const ListTile(
                  leading: SmallText(text: "Adding members"),
                  trailing: SmallText(text: "Members"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                    leading: const SmallText(text: "Self join"),
                    trailing: Switch(
                      value: true,
                      onChanged: ((value) {}),
                    )),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: SmallText(
                    text: "Any Workspace member can edit and join the board")),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 50),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const SmallText(text: "Close board"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CloseBoard();
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
