import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/custombutton.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/colors.dart';

class Collaborators extends StatefulWidget {
  const Collaborators({super.key});

  @override
  State<Collaborators> createState() => _CollaboratorsState();
}

class _CollaboratorsState extends State<Collaborators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(text: 'Collaborators'),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'invitemembers');
              },
              child: const SmallText(
                text: "INVITE",
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SmallText(
                text: "collaborators (1/10)",
                fontSize: 16,
              ),
              const SizedBox(
                height: 15,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    tileColor: whiteShade,
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundColor: brandColor,
                      child: SmallText(text: "MY"),
                    ),
                    title: const SmallText(text: "Muhammad Younis"),
                    subtitle: const SmallText(text: "@muhammadyounis15"),
                    trailing: const SmallText(
                      text: "Admin",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // list tile on tap function
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .40,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: brandColor,
                                        child: SmallText(text: "My"),
                                      ),
                                      title: SmallText(text: "Muhammad Younis"),
                                      subtitle:
                                          SmallText(text: "@muhammadyounis15"),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: SmallText(
                                        text: "Admin",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SmallText(
                                      text:
                                          "Can view, create and edit Workspace boards, and change settings for the workspace",
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const SmallText(
                                      text:
                                          "You can't leave the Workspace because there \n must be at least one admin in the Workspace.",
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 50,
                                          child: CustomButton(
                                            color: Colors.blueGrey[300],
                                            text: 'Leave Workspace',
                                            onPressed: () {},
                                          )),
                                    )
                                  ]),
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SmallText(
                text: 'To view workspace guests, visit trello.com',
                color: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
