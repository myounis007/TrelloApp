import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: height * .35,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .25,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            ),
            const Text(
              'Basic Board',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Row(
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Made by trello',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.supervisor_account_sharp,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 6,
                ),
                Text('Good for teams', style: TextStyle(color: Colors.grey))
              ],
            )
          ],
        ),
      ),
    );
  }
}
