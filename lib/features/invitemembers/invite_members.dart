import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/colors.dart';

class InviteMembers extends StatefulWidget {
  const InviteMembers({super.key});

  @override
  State<InviteMembers> createState() => _InviteMembersState();
}

class _InviteMembersState extends State<InviteMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, size: 30),
        ),
        title: const HeadingText(text: "Invite to Board 1"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.contacts))
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Name, Email, Username",
                      prefix: Icon(Icons.search)),
                ),
              ),
              Card(
                child: ListTile(
                  textColor: brandColor,
                  title: SmallText(text: "Create board invite link"),
                  subtitle:
                      SmallText(text: "Anyone with a link can join the board"),
                  trailing: Icon(
                    Icons.add_circle_outline,
                    color: brandColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SmallText(
                    text: "Board member (1)",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                ),
                title: SmallText(text: "Muhammad younis"),
                subtitle: SmallText(text: "@muhammadyounis"),
                trailing: SmallText(text: "Admin"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xffADD8E6),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color.fromARGB(255, 240, 216, 137),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color.fromARGB(255, 0, 255, 140),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: HeadingText(
                  text: "Work together on a board",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SmallText(
                text:
                    "Use the search bar or invite link to share this board with others",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
