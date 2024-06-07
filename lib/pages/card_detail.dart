import 'package:flutter/material.dart';

import '../utills/colors.dart';
import 'edit_labels.dart';
import 'view_member.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();

  static const routeName = '/carddetail';
}

class _CardDetailsState extends State<CardDetails> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController checklistController = TextEditingController();
  bool showChecklist = false;
  bool addCardDescription = false;
  Map<int, bool> checked = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (showChecklist || addCardDescription)
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    showChecklist = false;
                    addCardDescription = false;
                  });
                },
                icon: const Icon(Icons.close, size: 30),
              ),
              title: const Text("New Item"),
              actions: [
                  IconButton(icon: const Icon(Icons.check), onPressed: () {})
                ])
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, size: 30),
              ),
              actions: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  )
                ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.picture_in_picture_sharp),
                  label: const Text("Cover")),
            ),
            Text(
              'cardddd',
              style: const TextStyle(fontSize: 20),
            ),
            RichText(
                text: TextSpan(
                    text: "args.brd.name",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: themeColor),
                    children: <TextSpan>[
                  const TextSpan(
                      text: ' in list ', style: TextStyle(fontSize: 12)),
                  TextSpan(text: "args.lst.name")
                ])),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Quick actions",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          showChecklist = true;
                        });
                      },
                      label: const Text("Add Checklist"),
                      icon: const CircleAvatar(
                        backgroundColor: brandColor,
                        radius: 15,
                        child: Icon(Icons.checklist),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text("Add Attachment"),
                      icon: const CircleAvatar(
                        backgroundColor: brandColor,
                        radius: 15,
                        child: Icon(Icons.attachment),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text("Members"),
                      icon: const CircleAvatar(
                        backgroundColor: brandColor,
                        radius: 15,
                        child: Icon(Icons.person),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.short_text),
              title: TextField(
                controller: descriptionController,
                onTap: () {
                  setState(() {
                    addCardDescription = true;
                  });
                },
                decoration:
                    const InputDecoration(hintText: "Add card description"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text("Labels"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const EditLabels();
                    });
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Members"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ViewMembers();
                    });
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range_outlined),
              title: const Text("Start date"),
              onTap: () {},
            ),
            ListTile(
              leading: const Text("Checklist"),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete)),
            ),
            Visibility(
              visible: showChecklist,
              child: TextField(
                controller: checklistController,
              ),
            ),
            const Text("Activity"),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 5.0),
        color: whiteShade,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 80,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const CircleAvatar(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Add comment",
                  suffix: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.send))),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.attachment))
        ]),
      ),
    );
  }
}
