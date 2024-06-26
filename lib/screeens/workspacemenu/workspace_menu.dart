import 'package:flutter/material.dart';
import 'package:trelloapps/utills/constants.dart';
import 'package:trelloapps/widgets/custombutton.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/colors.dart';

class WorkspaceMenu extends StatefulWidget {
  const WorkspaceMenu({super.key});

  @override
  State<WorkspaceMenu> createState() => _WorkspaceMenuState();
}

class _WorkspaceMenuState extends State<WorkspaceMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'workspacesetting');
              },
              icon: const Icon(Icons.settings))
        ],
        title: const HeadingText(
          text: "Workspace menu",
          fontSize: 20,
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text: "Muhammad younis's\n workspace",
                        fontSize: 20,
                      ),
                      Text.rich(
                        // ignore: deprecated_member_use
                        textScaleFactor: 1.3,
                        TextSpan(
                          children: [
                            TextSpan(text: "@workspaces"),
                            TextSpan(text: ' (Free) '),
                            WidgetSpan(
                                child: Icon(Icons.lock,
                                    color: dangerColor, size: 14)),
                            TextSpan(
                                text: "Public",
                                style: TextStyle(color: dangerColor))
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green[400],
                    child: const Text(
                      "MY",
                      style: TextStyle(color: whiteShade),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    child: const Row(
                      children: [
                        Icon(size: 30, Icons.stars),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: SmallText(text: menudescription)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: SmallText(
                          text: 'Start Trial',
                          color: Colors.blue[900],
                        )),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListTile(
                tileColor: whiteShade,
                title: const Row(children: [
                  Icon(size: 30, Icons.person),
                  SizedBox(
                    width: 20,
                  ),
                  SmallText(
                    text: "Collaborators",
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                subtitle: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 18.0, right: 230),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: brandColor,
                            child: SmallText(
                              text: 'MY',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Positioned(
                            right: -6,
                            bottom: 0,
                            child: Icon(
                                size: 35,
                                color: whitecolor,
                                Icons.keyboard_double_arrow_up),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'collaborators');
                          },
                          text: 'Manage',
                          color: Colors.blue,
                          textStyle:
                              const TextStyle(color: whitecolor, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'collaborators');
            },
          ),
        ],
      ),
    );
  }
}
