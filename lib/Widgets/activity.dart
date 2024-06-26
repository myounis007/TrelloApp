import 'package:flutter/material.dart';

import '../utills/colors.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ActivityTile(activity: 'Muhammad younis added....'),
        ActivityTile(activity: 'Muhammad younis changed....'),
        ActivityTile(activity: 'Muhammad younis updated....'),
        ActivityTile(activity: 'Muhammad younis added....'),
        ActivityTile(activity: 'Muhammad younis changed....'),
        ActivityTile(activity: 'Muhammad younis updated....'),
      ],
    );
  }
}

class ActivityTile extends StatefulWidget {
  final String activity;
  const ActivityTile({required this.activity, super.key});

  @override
  State<ActivityTile> createState() => _ActivityTileState();
}

class _ActivityTileState extends State<ActivityTile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: brandColor,
        ),
        title: Text(widget.activity),
        subtitle: const Text("01 Jan 2023 at 1:11 am"),
      ),
    );
  }
}
