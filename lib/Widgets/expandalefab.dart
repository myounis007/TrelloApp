import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
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
        title: Text('Main Screen'),
      ),
      body: Center(child: Text('Main Screen Content')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isExpanded)
            Column(
              children: [
                FloatingActionButton(
                  heroTag: 'createCard',
                  onPressed: () {},
                  child: Icon(Icons.add_card),
                  tooltip: 'Create Card',
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'createBoard',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateBoardScreen()),
                    );
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
    );
  }
}

class CreateBoardScreen extends StatefulWidget {
  @override
  _CreateBoardScreenState createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  List<Widget> lists = [];

  void _addList() {
    setState(() {
      lists.add(ListViewWidget());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Board'),
      ),
      body: PageView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return lists[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addList,
        child: Icon(Icons.add),
        tooltip: 'Add List',
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          'List View',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
