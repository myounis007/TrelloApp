import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/colors.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(MdiIcons.trello),
              title: const SmallText(text: "GET STARTED"),
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    color: brandColor,
                    height: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SmallText(
                      text: "Stay on track and up-to-date",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SmallText(
                      text:
                          "Invite people to boards and cards, add comments, and adjust due dates all from the new Trello Home. We'll show the most important activity here.",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
