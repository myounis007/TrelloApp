import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/custombutton.dart';
import 'package:trelloapps/Widgets/customdrawer.dart';

import 'package:trelloapps/Widgets/headingtext.dart';
import 'package:trelloapps/Widgets/smalltext.dart';

import '../Widgets/expandalefab.dart';

class BoardHomePage extends StatefulWidget {
  const BoardHomePage({super.key});

  @override
  _BoardHomePageState createState() => _BoardHomePageState();
}

class _BoardHomePageState extends State<BoardHomePage>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleFab() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 30, color: Colors.white),
        backgroundColor: Colors.blue[700],
        title: const HeadingText(
          text: 'Boards',
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
      drawer: const CustomDrawer(),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Colors.amber, shape: BoxShape.circle),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 46, 43, 33),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(122, 103, 43, 1),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const HeadingText(
                  fontSize: 20, text: "Tell your team you're here! "),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'Share your profile so collaborators\n',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    TextSpan(
                        text: 'can add you to Wordspace and\n',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    TextSpan(
                        text: '                       boards',
                        style: TextStyle(color: Colors.black, fontSize: 20))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: CustomButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    text: 'Share your Trello Profile',
                    //textStyle: TextStyle(fontSize: 18),
                    onPressed: () {}),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(122, 103, 43, 1),
                    shape: BoxShape.circle),
              ),
              const HeadingText(fontSize: 22, text: 'Solo for now?'),
              const SizedBox(
                height: 20,
              ),
              const SmallText(
                  fontSize: 20,
                  text:
                      'Get Started with a board and share it\n           with collaborators later'),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: CustomButton(
                    color: Colors.lightBlue[100],
                    text: 'Create yout first Trello board',
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                    onPressed: () {
                      Navigator.pushNamed(context, 'createboard');
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isExpanded)
            Column(
              children: [
                FloatingActionButton(
                  heroTag: 'createCard',
                  onPressed: () {},
                  child: const Icon(Icons.add_card),
                  tooltip: 'Create Card',
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'createBoard',
                  onPressed: () {
                    Navigator.pushNamed((context), 'createboardwithfloat');
                  },
                  child: Icon(Icons.add_box),
                  tooltip: 'Create Board',
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'browseTemplates',
                  onPressed: () {},
                  child: Icon(Icons.folder_open),
                  tooltip: 'Browse Templates',
                ),
                SizedBox(height: 10),
              ],
            ),
          FloatingActionButton(
            heroTag: 'expandFab',
            onPressed: _toggleFab,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animation,
            ),
            tooltip: 'Expand',
          ),
        ],
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: const ExpandableFab(
      //   type: ExpandableFabType.up,
      //   backgroundColor: Colors.green,
      //   expandedFabSize: ExpandableFabSize.regular,
      //   icon: Icons.add,
      //   children: [
      //     // CustomFloatingAction("Workspace", Icons.book, 'createworkspace'),
      //     CustomFloatingAction("Board", Icons.book, 'createboard'),
      //     // CustomFloatingAction("Card", Icons.card_membership, 'createcard')
      //   ],
      // ),
    );
  }
}
