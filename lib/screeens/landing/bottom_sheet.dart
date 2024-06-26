import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trelloapps/screeens/auth/signarguments.dart';
import 'package:trelloapps/screeens/auth/signup_trello.dart';

import '../../utills/colors.dart';
import '../../utills/config.dart';

class LandingBottomSheet extends StatefulWidget {
  final Enum type;
  const LandingBottomSheet(this.type, {super.key});

  @override
  State<LandingBottomSheet> createState() => _LandingBottomSheetState();
}

class _LandingBottomSheetState extends State<LandingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                SignUpTrello.routeName,
                arguments: SignArguments(widget.type),
              );
            },
            leading: const Icon(
              Icons.email,
              color: brandColor,
            ),
            title: Text(
              (widget.type == Sign.signUp)
                  ? " SIGN UP WITH EMAIL"
                  : "LOG IN WITH EMAIL",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              MdiIcons.google,
              color: brandColor,
            ),
            title: Text(
              (widget.type == Sign.signUp)
                  ? " SIGN UP WITH GOOGLE"
                  : "LOG IN WITH GOOGLE",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              MdiIcons.microsoft,
              color: brandColor,
            ),
            title: Text(
              (widget.type == Sign.signUp)
                  ? " SIGN UP WITH MICROSOFT"
                  : "LOG IN WITH MICROSOFT",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              MdiIcons.apple,
              color: brandColor,
            ),
            title: Text(
              (widget.type == Sign.signUp)
                  ? " SIGN UP WITH APPLE"
                  : "LOG IN WITH APPLE",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
