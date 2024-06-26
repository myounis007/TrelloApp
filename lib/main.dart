import 'package:flutter/material.dart';
import 'package:trelloapps/screeens/aboutboard/about_board.dart';
import 'package:trelloapps/screeens/archievedcards/archieved_cards.dart';
import 'package:trelloapps/screeens/archievedlists/archieved_lists.dart';
import 'package:trelloapps/screeens/auth/signup_trello.dart';

import 'package:trelloapps/screeens/board/board.dart';
import 'package:trelloapps/screeens/boardbackground/board_background.dart';
import 'package:trelloapps/screeens/carddetail/card_detail.dart';
import 'package:trelloapps/screeens/collaborators/collaborators.dart';
import 'package:trelloapps/screeens/createboard/create_board.dart';
import 'package:trelloapps/features/drawer/drawerwithfeatures/Settings.dart';
import 'package:trelloapps/screeens/drawer/drawerwithfeatures/mycards.dart';
import 'package:trelloapps/screeens/drawer/drawerwithfeatures/offline_boards.dart';
import 'package:trelloapps/screeens/editlabels/edit_labels.dart';
import 'package:trelloapps/screeens/emailtoboardsetting/email_to_board_setting.dart';
import 'package:trelloapps/screeens/invitemembers/invite_members.dart';
import 'package:trelloapps/screeens/powersup/powersup.dart';

import 'screeens/createcard/create_card.dart';
import 'screeens/home/boardshome.dart';
import 'screeens/home/home_page.dart';
import 'screeens/landing/landing_page.dart';
import 'screeens/notifications/custom_notifications.dart';
import 'screeens/workspacemenu/workspace_menu.dart';
import 'screeens/workspacesetting/workspace_setting.dart';
import 'screeens/allcreatedboards/all_created_boards.dart';
import 'screeens/boardmenu/board_menu.dart';
import 'screeens/userworkspace/boardandhighlight.dart';
import 'screeens/boardsetting/borad_setting.dart';
import 'screeens/copyboard/copyboard.dart';
import 'screeens/templatesofboard/start_with_template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trello App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        'allboards': (context) => const Boardshome(),
        'boardandhighlight': (context) => const BoardAndHighlightPage(),
        'home': (context) => const BoardHomePage(),
        'workspacemenu': (context) => const WorkspaceMenu(),
        'collaborators': (context) => const Collaborators(),
        'invitemembers': (context) => const InviteMembers(),
        'workspacesetting': (context) => const WorkspaceSettings(),
        'createboard': (context) => const Createboard(),
        'boardbg': (context) => const BoardBackground(),
        'createcard': (context) => const CreateCard(),
        'createboardwithtempalte': (context) => const StartWithTemplate(),
        'boards': (context) => const Boardshome(),
        'notifications': (context) => const Notifications(),
        'basicboard': (context) => const CreatedBoards(),
        'boardmenu': (context) => const BoardMenu(),
        'copyboard': (context) => const CopyBoard(),
        'boardsetting': (context) => const BoardSettings(),
        'boardscreen': (context) => const BoardScreeen(),
        'archivedlists': (context) => const ArchivedLists(),
        'archivedcards': (context) => const ArchivedCards(),
        'emailtoboard': (context) => const EmailToBoard(),
        'aboutboard': (context) => const AboutBoard(),
        'powerups': (context) => const PowerUps(),
        'carddetail': (context) => const CardDetails(),
        'editlabels': (context) => const EditLabels(),
        'mycards': (context) => const MyCards(),
        'offlineboards': (context) => const OfflineBoards(),
        'settings': (context) => const Settings(),
        SignUpTrello.routeName: (context) => const SignUpTrello(),
      },
    );
  }
}
