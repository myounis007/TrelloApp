import 'package:flutter/material.dart';

import 'package:trelloapps/widgets/custombutton.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/constants.dart';

class Createboard extends StatefulWidget {
  const Createboard({super.key});

  @override
  State<Createboard> createState() => _CreateboardState();
}

class _CreateboardState extends State<Createboard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Map<String, String>? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        title: const HeadingText(text: "Create board"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                color: Colors.black12,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: ' Enter Board name',
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 145.0),
                          child: SmallText(
                            text: 'Workspace',
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SmallText(text: 'Muhammad younis workspace'),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            size: 30, Icons.arrow_drop_down_outlined))
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SmallText(text: "Visibility"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: DropdownButton<Map<String, String>>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(size: 30, Icons.arrow_drop_down_outlined),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  onChanged: (Map<String, String>? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
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
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SmallText(text: 'Board background'),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'boardbg');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 25),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'allboards');
                      // createWorkspace(context,
                      //     name: nameController.text,
                      //     description: descriptionController.text,
                      //     visibility: dropdownValue!["type"] ?? "");
                    },
                    text: 'create board',
                    color: Colors.blue,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
