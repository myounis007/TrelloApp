import 'package:flutter/material.dart';



class CreateBoardScreen extends StatefulWidget {
  const CreateBoardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
