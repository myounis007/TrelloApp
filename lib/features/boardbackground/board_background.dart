import 'package:flutter/material.dart';

import '../../widgets/headingtext.dart';
import '../../utills/config.dart';

class BoardBackground extends StatefulWidget {
  const BoardBackground({super.key});

  @override
  State<BoardBackground> createState() => _BoardBackgroundState();
}

class _BoardBackgroundState extends State<BoardBackground> {
  String? selectedBackground;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(text: "Board background"),
        centerTitle: false,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 3,
            mainAxisSpacing: 20),
        itemCount: backgrounds.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBackground = (backgrounds[index]);
              });
            },
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(int.parse(backgrounds[index].substring(1, 7),
                              radix: 16) +
                          0xff000000),
                      borderRadius: BorderRadius.circular(5)),
                ),
                (backgrounds[index] == selectedBackground)
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          );
        },
      ),
    );
  }
}
