import 'package:flutter/material.dart';

import '../../widgets/custombutton.dart';
import '../../widgets/headingtext.dart';
import '../../widgets/smalltext.dart';

class Boardwithfloatinbutton extends StatelessWidget {
  const Boardwithfloatinbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 46, 43, 33),
                          shape: BoxShape.circle),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(122, 103, 43, 1),
                          shape: BoxShape.circle),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const HeadingText(
                    fontSize: 20, text: "Tell your team you're here! "),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Share your profile so collaborators\n',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      TextSpan(
                          text: 'can add you to Wordspace and\n',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      TextSpan(
                          text: '                       boards',
                          style: TextStyle(color: Colors.black, fontSize: 20))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: CustomButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      text: 'Share your Trello Profile',
                      //textStyle: TextStyle(fontSize: 18),
                      onPressed: () {}),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(122, 103, 43, 1),
                      shape: BoxShape.circle),
                ),
                const HeadingText(fontSize: 22, text: 'Solo for now?'),
                const SizedBox(
                  height: 20,
                ),
                const SmallText(
                    fontSize: 20,
                    text:
                        'Get Started with a board and share it\n           with collaborators later'),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: CustomButton(
                      color: Colors.lightBlue[100],
                      text: 'Create yout first Trello board',
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      onPressed: () {
                        Navigator.pushNamed(context, 'createboardwithtempalte');
                      }),
                )
              ],
            ),
          )),
    );
  }
}
