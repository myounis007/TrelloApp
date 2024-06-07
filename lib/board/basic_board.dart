import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/headingtext.dart';
import 'package:trelloapps/Widgets/smalltext.dart';
import 'package:trelloapps/utills/colors.dart';

class BasicBoardPage extends StatefulWidget {
  const BasicBoardPage({super.key});

  @override
  State<BasicBoardPage> createState() => _BasicBoardPageState();
}

class _BasicBoardPageState extends State<BasicBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: InkWell(
          child: const Icon(size: 30, color: Colors.white, Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            const HeadingText(
              fontSize: 20,
              text: 'Basic Board',
              color: Colors.white,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 130,
                color: Colors.blueGrey,
                child: const Row(
                  children: [
                    Icon(Icons.abc),
                    SizedBox(
                      width: 10,
                    ),
                    SmallText(
                      text: 'Board',
                      fontSize: 20,
                    ),
                    Icon(color: Colors.white, size: 24, Icons.arrow_downward)
                  ],
                ),
              ),
            )
          ],
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'boardmenu');
              },
              child: Icon(color: Colors.white, Icons.more_vert))
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
