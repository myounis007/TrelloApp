import 'package:flutter/material.dart';
import 'package:trelloapps/utills/colors.dart';
import 'package:trelloapps/widgets/headingtext.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> popupmenu = ["Push notification settings"];
  late String selectedMenu;
  List<String> list = ["All Types", "Me", "Comments", "Join requests"];
  String selected = "All Types";
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: brandColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            color: Colors.white,
            Icons.close,
            size: 30,
          ),
        ),
        // ignore: prefer_const_constructors
        title: HeadingText(
          fontSize: 20,
          text: 'Notifications',
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                color: Colors.white,
                Icons.library_add_check_outlined,
                size: 30,
              )),
          PopupMenuButton(
              iconColor: Colors.white,
              initialValue: popupmenu[0],
              onSelected: (String item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: popupmenu[0],
                      child: Text(
                        popupmenu[0],
                      ),
                    )
                  ])
        ],
      ),
      body: Stack(children: [
        Row(
          children: [
            OutlinedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 250,
                      child: ListView(
                        children: buildWidgets(),
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Text(selected),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            Visibility(
              visible: show,
              child: OutlinedButton(
                onPressed: () {
                  setState(
                    () {
                      show = !show;
                    },
                  );
                },
                child: const Text("Unread"),
              ),
            ),
            Visibility(
                visible: !show,
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Unread"))),
          ],
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: HeadingText(
              fontSize: 20,
              text:
                  "You don't have any notifications that match the selected filters",
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]),
    );
  }

  List<Widget> buildWidgets() {
    List<Widget> dropdownLists = [];
    for (int i = 0; i < list.length; i++) {
      dropdownLists.add(ListTile(
        onTap: () {
          setState(() {
            selected = list[i];
          });
          Navigator.pop(context);
        },
        leading:
            (selected == list[i]) ? const Icon(Icons.check) : const SizedBox(),
        title: Text(
          list[i],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ));
    }
    return dropdownLists;
  }
}
