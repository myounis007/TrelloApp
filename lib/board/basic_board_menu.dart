import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/headingtext.dart';
import 'package:trelloapps/Widgets/smalltext.dart';

import '../utills/colors.dart';
import 'board_visibility.dart';

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
                    width: 60,
                    decoration: const BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                    width: 60,
                    decoration: const BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                    width: 60,
                    decoration: const BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                    width: 60,
                    decoration: const BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListTile(
              tileColor: whiteShade,
              title: Row(children: [
                Icon(Icons.person),
                SizedBox(
                  width: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text("Members"),
                ),
              ]),
              subtitle: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 18.0,
                    ),
                    child: Align(
                      child: CircleAvatar(
                        backgroundColor: brandColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: SizedBox(
                      height: 37,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: brandColor),
                        onPressed: () {
                          // Navigator.pushNamed(context, "invitemember");
                        },
                        child: const Text("Invite"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              color: whiteShade,
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text("About this board"),
                onTap: () {
                  // Navigator.pushNamed(context, '/aboutboard');
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
                    // Navigator.pushNamed(context, '/powerups');
                  },
                ),
              )),
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
              )),
        ],
      )),
    );
  }
}
