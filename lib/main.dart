import 'package:flutter/material.dart';
import 'package:trelloapps/features/aboutboard/about_board.dart';
import 'package:trelloapps/features/archievedcards/archieved_cards.dart';
import 'package:trelloapps/features/archievedlists/archieved_lists.dart';
import 'package:trelloapps/features/auth/signup_trello.dart';

import 'package:trelloapps/features/board/board.dart';
import 'package:trelloapps/features/boardbackground/board_background.dart';
import 'package:trelloapps/features/carddetail/card_detail.dart';
import 'package:trelloapps/features/collaborators/collaborators.dart';
import 'package:trelloapps/features/createboard/create_board.dart';
import 'package:trelloapps/features/drawer/drawerwithfeatures/Settings.dart';
import 'package:trelloapps/features/drawer/drawerwithfeatures/mycards.dart';
import 'package:trelloapps/features/drawer/drawerwithfeatures/offline_boards.dart';
import 'package:trelloapps/features/editlabels/edit_labels.dart';
import 'package:trelloapps/features/emailtoboardsetting/email_to_board_setting.dart';
import 'package:trelloapps/features/invitemembers/invite_members.dart';
import 'package:trelloapps/features/powersup/powersup.dart';

import 'features/createcard/create_card.dart';
import 'features/home/boardshome.dart';
import 'features/home/home_page.dart';
import 'features/landing/landing_page.dart';
import 'features/notifications/custom_notifications.dart';
import 'features/workspacemenu/workspace_menu.dart';
import 'features/workspacesetting/workspace_setting.dart';
import 'features/allcreatedboards/all_created_boards.dart';
import 'features/boardmenu/board_menu.dart';
import 'features/userworkspace/boardandhighlight.dart';
import 'features/boardsetting/borad_setting.dart';
import 'features/copyboard/copyboard.dart';
import 'features/templatesofboard/start_with_template.dart';

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
