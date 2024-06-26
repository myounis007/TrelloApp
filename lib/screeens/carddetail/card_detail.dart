import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/colors.dart';
import '../editlabels/edit_labels.dart';
import '../viewmembers/view_member.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();

  static const routeName = 'carddetail';
}

class _CardDetailsState extends State<CardDetails> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController checklistController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  bool showChecklist = false;
  bool addCardDescription = false;
  Map<int, bool> checked = {};
  final TextEditingController _startdateController = TextEditingController();

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _startdateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        reverse: true,
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
            const Text(
              'cardddd',
              style: TextStyle(fontSize: 20),
            ),
            RichText(
              text: const TextSpan(
                text: "board one",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: themeColor),
                children: <TextSpan>[
                  TextSpan(text: ' in list ', style: TextStyle(fontSize: 12)),
                  TextSpan(text: "board one")
                ],
              ),
            ),
            const Divider(),
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
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[300],
              child: ListTile(
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
            ),
            Container(
              color: Colors.grey[300],
              child: ListTile(
                leading: const Icon(Icons.label),
                title: const Text("Labels..."),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const EditLabels();
                      });
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey[300],
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Members..."),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ViewMembers();
                      });
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey[300],
              child: SizedBox(
                child: TextField(
                  controller: _startdateController,
                  decoration: InputDecoration(
                    labelText: 'Start Date...',
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                  readOnly: true,
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: SizedBox(
                child: TextField(
                  controller: _startdateController,
                  decoration: InputDecoration(
                    labelText: 'end Date...',
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                  readOnly: true,
                ),
              ),
            ),
            Visibility(
              visible: showChecklist,
              child: TextField(
                controller: checklistController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.grey[300],
              title: const SmallText(text: "Activity"),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            )
          ]),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 5.0),
          color: whiteShade,
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const CircleAvatar(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: "Add comment",
                  suffix: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.attachment),
            )
          ]),
        ),
      ),
    );
  }
}
