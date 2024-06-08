import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/customdrawer.dart';
import 'package:trelloapps/pages/board/boardwithfloatinbutton.dart';

import '../../Widgets/headingtext.dart';

class BoardAndHighlightPage extends StatefulWidget {
  const BoardAndHighlightPage({super.key});

  @override
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
              icon: const Icon(Icons.notifications_none)),
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
                Center(child: Text('Content of Tab 2')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
