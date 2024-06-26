import 'package:flutter/material.dart';
import 'package:trelloapps/utills/config.dart';
import 'package:trelloapps/utills/services.dart';
import 'package:trelloapps/widgets/headingtext.dart';
import 'package:trelloapps/widgets/smalltext.dart';

import '../../../utills/colors.dart';
import '../../../widgets/bluerectangle_square.dart';


class OfflineBoards extends StatefulWidget {
  const OfflineBoards({super.key});

  @override
  State<OfflineBoards> createState() => _OfflineBoardsState();
}

class _OfflineBoardsState extends State<OfflineBoards> with Services {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(text: "Offline boards"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              leading: SmallText(text: 'workspace one'),
              tileColor: whiteShade,
            ),
            ListTile(
              leading: ColorSquare(bckgrd: backgrounds[0]),
              title: const SmallText(text: 'board one'),
              trailing: Switch(
                  value: false,
                  activeColor: brandColor,
                  onChanged: (bool value) {}),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildWorkspacesAndBoards(List wkspcs) {
    List<Widget> workspacesboards = [];
    Widget workspace;

    for (int i = 0; i < wkspcs.length; i++) {
      workspace = ListTile(
        tileColor: whiteShade,
        leading: Text(wkspcs[i].name),
      );

      workspacesboards.add(workspace);

      workspacesboards.add(FutureBuilder(
          future: (wkspcs[i].id!),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List children = snapshot.data as List;

              if (children.isNotEmpty) {
                return Column(children: buildBoards(children, wkspcs[i]));
              }
            }
            return const SizedBox.shrink();
          }));
    }
    //  }
    return workspacesboards;
  }

  List<Widget> buildBoards(List brd, wkspcs) {
    List<Widget> boards = [];
    for (int j = 0; j < brd.length; j++) {
      boards.add(ListTile(
        leading: ColorSquare(bckgrd: brd[j].background),
        title: Text(brd[j].name),
        onTap: () {},
        trailing: Switch(
          value: brd[j].availableOffline ?? false,
          activeColor: brandColor,
          onChanged: (bool value) {
            setState(() {
              brd[j].availableOffline = value;
            });
          },
        ),
      ));
    }
    return boards;
  }
}
