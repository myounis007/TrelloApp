import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/custombutton.dart';
import 'package:trelloapps/Widgets/headingtext.dart';
import 'package:trelloapps/Widgets/smalltext.dart';

import '../utills/colors.dart';
import '../utills/constants.dart';

class CopyBoard extends StatefulWidget {
  const CopyBoard({super.key});

  @override
  State<CopyBoard> createState() => _CopyBoardState();
}

class _CopyBoardState extends State<CopyBoard> {
  final TextEditingController nameController = TextEditingController();
  String? dropdownValue;
  List<String> workspaces = [];
  Map<String, String>? visibilityDropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const HeadingText(
          text: 'Copy board',
          color: Colors.white,
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nameController,
                    cursorColor: Colors.blue[900],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Board name",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      print('workspace name');
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    label: Text(
                                      'WordSpace',
                                    ),
                                    labelStyle: TextStyle(color: Colors.blue)),
                              ),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ]),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SmallText(
                    text: 'visibility',
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: DropdownButton<Map<String, String>>(
                      hint: const Text("Visibility"),
                      isExpanded: true,
                      value: visibilityDropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      style: const TextStyle(color: maincolor),
                      onChanged: (Map<String, String>? value) {
                        setState(() {
                          visibilityDropdownValue = value!;
                        });
                      },
                      items: visibilityConfigurations
                          .map<DropdownMenuItem<Map<String, String>>>(
                              (Map<String, String> value) {
                        return DropdownMenuItem<Map<String, String>>(
                          value: value,
                          child: Text(value["type"]!),
                        );
                      }).toList(),
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SwitchListTile(
                      value: true,
                      onChanged: ((value) {}),
                      title: const SmallText(text: 'Keep Cards')),
                  const SmallText(
                      text:
                          "Activities and members will not be copied to the new board"),
                ],
              ),
              Container(
                width: 300,
                child: CustomButton(
                    color: Colors.grey[400],
                    text: 'Copy board',
                    textColor: Colors.black26,
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
