import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:trelloapps/screeens/drawer/customdrawer.dart';

import '../../utills/colors.dart';
import '../../utills/config.dart';
import '../../utills/services.dart';
import '../../widgets/bluerectangle_square.dart';
import '../../widgets/headingtext.dart';
import '../../widgets/smalltext.dart';
import '../floatingactionbutton/custom_floating_button.dart';

class Boardshome extends StatefulWidget {
  const Boardshome({super.key});

  @override
  State<Boardshome> createState() => _BoardshomeState();
}

class _BoardshomeState extends State<Boardshome> with Services {
  // final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: brandColor,
        title: const HeadingText(
          text: 'Boards',
          color: whitecolor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              search(context, []);
            },
            icon: const Icon(color: whitecolor, Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'notifications');
            },
            icon: const Icon(color: whitecolor, Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              tileColor: whiteShade,
              leading: const SmallText(text: 'workspace names'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'workspacemenu');
                  },
                  icon: const Icon(Icons.more_horiz)),
            ),
            ListTile(
              leading: ColorSquare(bckgrd: backgrounds[0]),
              title: const SmallText(text: 'Board 1'),
              onTap: () {
                Navigator.pushNamed(context, 'boardscreen');
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        distance: 70,
        // key: _key,
        type: ExpandableFabType.up,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.add),
            fabSize: ExpandableFabSize.regular,
            backgroundColor: Colors.green[400],
            shape: const CircleBorder(),
            angle: 0),
        closeButtonBuilder: FloatingActionButtonBuilder(
          size: 56,
          builder: (BuildContext context, void Function()? onPressed,
              Animation<double> progress) {
            return FloatingActionButton(
              backgroundColor: Colors.green[400],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              onPressed: onPressed,
              child: const Icon(Icons.close),
            );
          },
        ),
        children: const [
          CustomFloatingActionButton(
            title: 'Board',
            icon: Icons.card_membership_outlined,
            route: 'createboard',
          ),
          CustomFloatingActionButton(
            title: 'Card',
            icon: Icons.card_membership_outlined,
            route: 'createcard',
          ),
          CustomFloatingActionButton(
            title: 'Browse templates',
            icon: Icons.book,
            route: 'createboardwithtempalte',
          ),
        ],
      ),
    );
  }
}
