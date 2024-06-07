import 'package:flutter/material.dart';

import 'package:trelloapps/Widgets/smalltext.dart';

import '../utills/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool active = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
            padding: const EdgeInsets.only(left: 10, top: 4),
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: brandColor,
                ),
                const SmallText(
                  text: '@muhammadyounis15',
                  color: Colors.white,
                ),
                const SmallText(
                  text: "younis4707@gmail.com",
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallText(
                      text: "trellouser@email",
                      color: Colors.white,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            active = !active;
                          });
                        },
                        icon: Icon((active)
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up))
                  ],
                )
              ],
            )),
        (active)
            ? Column(
                children: [
                  ListTile(
                    tileColor: Colors.grey[350],
                    leading: const Icon(
                      Icons.pages,
                      color: brandColor,
                    ),
                    title: const Text(
                      'Boards',
                      style: TextStyle(
                          color: brandColor, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'homepage');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.card_membership),
                    title: const Text("Muhammad Younis's"),
                    subtitle: Text('Workspace'),
                    trailing: Icon(Icons.more_vert),
                    onTap: () {
                      Navigator.pushNamed(context, 'boardandhighlight');
                    },
                  ),
                  const Divider(
                    height: 1,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: const Icon(Icons.card_membership),
                    title: const Text("My cards"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.pages),
                    title: const Text("Offline boards"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline_rounded),
                    title: const Text("Help!"),
                    onTap: () {},
                  ),
                ],
              )
            : ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add account'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              )
      ]),
    );
  }
}
