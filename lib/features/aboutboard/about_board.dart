import 'package:flutter/material.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/constants.dart';

class AboutBoard extends StatefulWidget {
  const AboutBoard({super.key});

  @override
  State<AboutBoard> createState() => _AboutBoardState();
}

class _AboutBoardState extends State<AboutBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(text: "About this board"),
        centerTitle: false,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: SmallText(
              text: "Made by",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 26,
              child: SmallText(text: 'My'),
            ),
            title: Text("Younis"),
            subtitle: Text("@younis"),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SmallText(
              text: "Description",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(defaultDescription),
          )
        ]),
      ),
    );
  }
}
