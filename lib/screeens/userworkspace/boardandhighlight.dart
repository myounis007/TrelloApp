import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:trelloapps/screeens/drawer/customdrawer.dart';
import 'package:trelloapps/screeens/boardfloatingbutton/boardwithfloatinbutton.dart';
import 'package:trelloapps/screeens/userworkspace/highlights.dart';

import '../floatingactionbutton/custom_floating_button.dart';
import '../../widgets/headingtext.dart';

class BoardAndHighlightPage extends StatefulWidget {
  const BoardAndHighlightPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BoardAndHighlightPageState createState() => _BoardAndHighlightPageState();
}

class _BoardAndHighlightPageState extends State<BoardAndHighlightPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 30, color: Colors.white),
        backgroundColor: Colors.blue[700],
        title: const HeadingText(
          fontSize: 25,
          text: 'Muhammad Younis',
          color: Colors.white,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "notifications");
            },
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'workspacemenu');
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            unselectedLabelColor: Colors.black38,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'BOARDS',
              ),
              Tab(
                text: 'HIGHLIGHTS',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Boardwithfloatinbutton(),
                Highlights(),
              ],
            ),
          ),
        ],
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
            title: 'Templates',
            icon: Icons.book,
            route: 'createboardwithtempalte',
          ),
        ],
      ),
    );
  }
}
