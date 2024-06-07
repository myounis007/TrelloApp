import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:trelloapps/Widgets/custombutton.dart';

import 'package:trelloapps/Widgets/smalltext.dart';
import 'package:trelloapps/Widgets/headingtext.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.abc,
              color: Colors.white,
            ),
            HeadingText(
              text: 'Trello',
              color: Colors.white,
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/landing.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SmallText(
                fontWeight: FontWeight.bold,
                text: 'Move teamwork forward — \n even on the go',
                color: Colors.white,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                      color: Colors.white,
                      text: 'Sign up',
                      textStyle: const TextStyle(color: Colors.black),
                      onPressed: () {
                        Navigator.pushNamed(context, 'signup');
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      color: Colors.black,
                      text: 'Log in',
                      textStyle: const TextStyle(color: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, 'homepage');
                      },
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          const TextSpan(
                              text: 'By signing up, you agree to our '),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('clicked');
                                },
                              text: 'Terms of Service',
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.5)),
                          const TextSpan(text: ' and \n'),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('clicked');
                              },
                            text: 'Privacy Policy\n',
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.5),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('clicked');
                              },
                            text: 'Contact Support',
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.5),
                          )
                        ])),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
