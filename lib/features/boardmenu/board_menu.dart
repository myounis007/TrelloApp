import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/activity.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/colors.dart';
import '../visibility/board_visibility.dart';
import '../../widgets/custombutton.dart';

class BoardMenu extends StatefulWidget {
  const BoardMenu({super.key});

  @override
  State<BoardMenu> createState() => _BoardMenuState();
}

class _BoardMenuState extends State<BoardMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(color: whitecolor, Icons.close),
        ),
        title: const HeadingText(
          text: 'Board Menu',
          color: Colors.white,
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(color: whitecolor, Icons.share))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: whitecolor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star_border,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const BoardVisibility();
                              });
                        },
                        icon: const Icon(
                          Icons.people,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: whitecolor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "copyboard");
                        },
                        icon: const Icon(
                          Icons.copy,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: whitecolor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "boardsetting");
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                      text: "Members",
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
                              Navigator.pushNamed(context, 'invitemembers');
                            },
                            text: 'Invite',
                            color: Colors.blue,
                            textStyle: const TextStyle(
                                color: whitecolor, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'invitemembers');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("About this board"),
                  onTap: () {
                    Navigator.pushNamed(context, 'aboutboard');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                color: whiteShade,
                child: ListTile(
                  leading: const Icon(Icons.rocket),
                  title: const Text("Power-Ups"),
                  onTap: () {
                    Navigator.pushNamed(context, 'powerups');
                  },
                  trailing: const SmallText(
                    text: 'Add',
                    color: brandColor,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  color: whiteShade,
                  child: ListTile(
                    leading: const Icon(Icons.push_pin_outlined),
                    title: const Text("Pin to home screen"),
                    onTap: () {},
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: SmallText(
                text: 'Activity',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Activity(),
          ],
        ),
      ),
    );
  }
}
