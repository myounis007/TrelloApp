import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trelloapps/utills/services.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../utills/colors.dart';
import '../../utills/config.dart';
import 'signarguments.dart';

class SignUpTrello extends StatefulWidget {
  const SignUpTrello({super.key});

  @override
  State<SignUpTrello> createState() => _SignUpTrelloState();

  static const routeName = 'sign';
}

class _SignUpTrelloState extends State<SignUpTrello> with Services {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as SignArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text((args.type == Sign.signUp)
            ? "Sign up - Log in with Atlassian account"
            : " Log in to continue -  Log in with Atlassian account "),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logo,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const HeadingText(text: 'Trello')
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  (args.type == Sign.signUp)
                      ? "Sign up to continue"
                      : "Log in to continue",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      hintText: "Enter your email"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      hintText: "Enter your password"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: SmallText(
                    text:
                        "By signing up, I accept the Atlassian Cloud Terms of Service and acknowledge the Privacy Policy"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: brandColor),
                    child: Text(
                      (args.type == Sign.signUp) ? "Sign up" : "Log in",
                      selectionColor: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const SmallText(
                text: 'or continue with',
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[500],
                height: 50,
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.google),
                    const SizedBox(
                      width: 10,
                    ),
                    const SmallText(
                      text: 'Google',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[500],
                height: 50,
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.microsoft),
                    const SizedBox(
                      width: 10,
                    ),
                    const SmallText(
                      text: 'Microsoft',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[500],
                height: 50,
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.apple),
                    const SizedBox(
                      width: 10,
                    ),
                    const SmallText(
                      text: 'Apple',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[500],
                height: 50,
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.slack),
                    const SizedBox(
                      width: 10,
                    ),
                    const SmallText(
                      text: 'Slack',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child: SizedBox(
          height: 120,
          child: Column(
            children: [
              const Divider(
                height: 1.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(MdiIcons.atlassian),
                  const HeadingText(text: 'ATLASSIAN')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 18.0),
                child: Text((args.type == Sign.signUp)
                    ? "This page is protected by reCAPTCHA and the Google Privacy Policy and Terms of Service apply"
                    : "Privacy Policy . User Notice"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
