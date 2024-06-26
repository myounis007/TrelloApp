// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(text: "Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              subtitle: SmallText(text: "Notifications"),
            ),
            const ListTile(
              title: SmallText(text: "Open system settings"),
            ),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            const ListTile(
              subtitle: SmallText(text: "Application theme"),
            ),
            const ListTile(
              title: SmallText(text: "Select theme"),
            ),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            const ListTile(
              subtitle: SmallText(text: "Accessibility"),
            ),
            ListTile(
              title: const SmallText(text: "Color blind friendly mode"),
              trailing: Switch(value: true, onChanged: ((value) {})),
            ),
            ListTile(
              title: const SmallText(text: "Enable animations"),
              trailing: Switch(value: true, onChanged: ((value) {})),
            ),
            ListTile(
              title: const SmallText(text: "Show label names on card front"),
              trailing: Switch(value: false, onChanged: ((value) {})),
            ),
            const Divider(),
            const ListTile(
              subtitle: SmallText(text: "Sync"),
            ),
            const ListTile(
              title: SmallText(text: "Sync queue"),
            ),
            const Divider(),
            const ListTile(
              subtitle: SmallText(text: "General"),
            ),
            const ListTile(
              title: SmallText(text: "Profile and visibility"),
            ),
            const ListTile(
              title: SmallText(text: "Create card details"),
            ),
            const ListTile(
              title: SmallText(text: "Set app language"),
            ),
            ListTile(
              title: const SmallText(text: "Delete account"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const SmallText(
                          text: "Delete account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: const SmallText(
                            text:
                                "You must log in on the web to delete your account"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const SmallText(text: "CANCEL")),
                          TextButton(
                              onPressed: () {},
                              child: const SmallText(text: "GO TO WEB"))
                        ],
                      );
                    });
              },
            ),
            const ListTile(
              title: SmallText(text: "About Trello"),
            ),
            const ListTile(
              title: SmallText(text: "More Atlassian apps"),
            ),
            const ListTile(
              title: SmallText(text: "Contact support"),
            ),
            const ListTile(
              title: SmallText(
                text: 'Manage accounts on browser',
                fontWeight: FontWeight.w400,
              ),
              subtitle: SmallText(
                  text: 'Review logged in accounts and remove\nfrom browser'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ListTile(
                title: const SmallText(text: "Log out"),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
