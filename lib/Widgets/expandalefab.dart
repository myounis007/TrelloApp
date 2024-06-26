import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
        title: const Text('Main Screen'),
      ),
      body: const Center(child: Text('Main Screen Content')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isExpanded)
            Column(
              children: [
                FloatingActionButton(
                  heroTag: 'createCard',
                  onPressed: () {},
                  tooltip: 'Create Card',
                  child: const Icon(Icons.add_card),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'createBoard',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateBoardScreen()),
                    );
                  },
                  tooltip: 'Create Board',
                  child: const Icon(Icons.add_box),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'browseTemplates',
                  onPressed: () {},
                  tooltip: 'Browse Templates',
                  child: const Icon(Icons.folder_open),
                ),
                const SizedBox(height: 10),
              ],
            ),
          FloatingActionButton(
            heroTag: 'expandFab',
            onPressed: _toggleFab,
            tooltip: 'Expand',
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animation,
            ),
          ),
        ],
      ),
    );
  }
}

class CreateBoardScreen extends StatefulWidget {
  const CreateBoardScreen({super.key});

  @override
  _CreateBoardScreenState createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  List<Widget> lists = [];

  void _addList() {
    setState(() {
      lists.add(const ListViewWidget());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Board'),
      ),
      body: PageView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return lists[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addList,
        tooltip: 'Add List',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.blueAccent,
      child: const Center(
        child: Text(
          'List View',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
