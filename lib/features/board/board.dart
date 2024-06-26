import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';

import 'package:trelloapps/features/board/board_object.dart';
import 'package:trelloapps/utills/colors.dart';
import 'package:trelloapps/utills/config.dart';

import 'board_list.dart';

class BoardScreeen extends StatefulWidget {
  const BoardScreeen({super.key});

  @override
  State<BoardScreeen> createState() => _BoardScreeenState();
}

class _BoardScreeenState extends State<BoardScreeen> {
  final List<BoardListObject> _listData = [
    BoardListObject(
      title: "list one",
      items: [
        BoardItemObject(title: 'card 1'),
        BoardItemObject(title: 'card 2'),
        BoardItemObject(title: 'card 3'),
        BoardItemObject(title: 'card 4'),
      ],
    ),
    BoardListObject(
      title: "list 2",
      items: [
        BoardItemObject(title: 'Item 3'),
      ],
    ),
    BoardListObject(
      title: "list 3",
      items: [
        BoardItemObject(title: 'Item 5'),
        BoardItemObject(title: 'Item 6')
      ],
    ),
  ];

  BoardViewController boardViewController = BoardViewController();
  bool showCard = false;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    List<BoardList> lists = [];
    for (var i = 0; i < _listData.length; i++) {
      lists.add(_createBoardList(_listData[i]) as BoardList);
    }
    lists.insert(
      _listData.length,
      BoardList(
        items: [
          BoardItem(
            item: GestureDetector(
              onTap: () {
                setState(
                  () {
                    show = true;
                  },
                );
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: brandColor,
                  ),
                  child: (!show)
                      ? const Text(
                          "Add list",
                          style: TextStyle(color: whiteShade),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'Add list'),
                          ),
                        )),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: (!show && !showCard)
          ? AppBar(
              backgroundColor: brandColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: const Text('board one'),
              centerTitle: false,
              actions: [
                const Icon(Icons.filter_list),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'notifications');
                  },
                  icon: const Icon(Icons.notifications_none),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'boardmenu');
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            )
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    (show) ? show = false : showCard = false;
                  });
                },
                icon: const Icon(Icons.close),
              ),
              title: Text((show) ? "Add list" : "Add Card"),
              centerTitle: false,
              actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
            ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BoardView(
          lists: lists,
          boardViewController: boardViewController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        onPressed: () {},
        child: const Icon(color: whitecolor, Icons.zoom_in),
      ),
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
      onStartDragItem: (listIndex, itemIndex, state) {},
      onDropItem:
          (oldListIndex, oldItemIndex, newlistindex, newitemIndex, state) {},
      onTapItem: (listIndex, itemIndex, state) {
        Navigator.pushNamed(context, 'carddetail');
      },
      item: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(itemObject.title!),
        ),
      ),
    );
  }

  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.add(buildBoardItem(list.items![i]) as BoardItem);
    }
    items.insert(
        list.items!.length,
        BoardItem(
          onTapItem: (listIndex, itemIndex, state) {
            setState(() {
              showCard = true;
            });
          },
          item: (!showCard)
              ? ListTile(
                  leading: const Text.rich(TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: Icon(
                        Icons.add,
                        size: 19,
                        color: whiteShade,
                      )),
                      WidgetSpan(
                        child: SizedBox(
                          width: 5,
                        ),
                      ),
                      TextSpan(
                          text: "Add card",
                          style: TextStyle(color: whiteShade)),
                    ],
                  )),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.image,
                      color: whiteShade,
                    ),
                    onPressed: () {},
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    // controller: textEditingControllers[index],
                    decoration: InputDecoration(hintText: "Card name"),
                  ),
                ),
        ));
    return BoardList(
      onStartDragList: (listIndex) {},
      onTapList: (listIndex) async {},
      onDropList: (listIndex, oldListIndex) {
        var list = _listData[oldListIndex!];
        _listData.removeAt(oldListIndex);
        _listData.insert(listIndex!, list);
      },
      headerBackgroundColor: brandColor,
      backgroundColor: brandColor,
      header: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              leading: SizedBox(
                width: 180,
                child: Text(
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  list.title!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              trailing: PopupMenuButton<String>(
                child: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    child: ListTile(
                      title: Text(listMenu[1]),
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: ListTile(
                      title: Text(listMenu[2]),
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: ListTile(
                      title: Text(listMenu[3]),
                    ),
                  ),
                  const PopupMenuItem<String>(
                      child: Divider(
                    height: 1,
                    thickness: 1,
                  )),
                  PopupMenuItem<String>(
                    child: ListTile(
                      title: Text(listMenu[4]),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  const PopupMenuItem<String>(
                      child: Divider(
                    height: 1,
                    thickness: 1,
                  )),
                  PopupMenuItem<String>(
                    child: ListTile(
                      title: Text(listMenu[5]),
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: ListTile(
                      title: Text(listMenu[6]),
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: ListTile(
                      title: Text(listMenu[7]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
      items: items,
    );
  }
}
