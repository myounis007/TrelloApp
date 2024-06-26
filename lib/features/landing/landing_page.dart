import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:trelloapps/features/landing/bottom_sheet.dart';
import 'package:trelloapps/widgets/custombutton.dart';

import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/utills/config.dart';
import 'package:trelloapps/utills/constants.dart';

import '../../utills/services.dart';

class LandingPage extends StatelessWidget with Services {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            const HeadingText(
              text: 'Trello',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              landing,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const HeadingText(
                text: headline,
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
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const LandingBottomSheet(Sign.signUp);
                            });
                        // signUp(context);
                      },
                    ),
                    const SizedBox(height: 5),
                    CustomButton(
                      color: Colors.black,
                      text: 'Log in',
                      textStyle: const TextStyle(color: Colors.white),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const LandingBottomSheet(Sign.logIn);
                            });
                        //logIn(context);
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
