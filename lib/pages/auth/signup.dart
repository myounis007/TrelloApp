import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/smalltext.dart';

class SignupToTrello extends StatefulWidget {
  const SignupToTrello({super.key});

  @override
  State<SignupToTrello> createState() => _SignupToTrelloState();
}

class _SignupToTrelloState extends State<SignupToTrello> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(hintText: "Enter your email"),
            ),
            TextField(
              controller: passwordcontroller,
              obscureText: true,
              decoration:
                  const InputDecoration(hintText: "Enter your password"),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.grey[400],
              onTap: () {},
              title: const SmallText(
                text: "CONTINUE WITH Google",
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.grey[400],
              onTap: () {},
              title: const SmallText(
                text: "CONTINUE WITH MicroSoft",
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.grey[400],
              onTap: () {},
              title: const SmallText(
                text: "CONTINUE WITH facebook",
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
