import 'package:flutter/material.dart';
import 'package:trelloapps/Widgets/expandalefab.dart';
import 'package:trelloapps/pages/board/borad_setting.dart';
import 'package:trelloapps/pages/board/copyboard.dart';
import 'package:trelloapps/pages/auth/landing_page.dart';
import 'package:trelloapps/pages/auth/signup.dart';
import 'package:trelloapps/pages/board/basic_board.dart';
import 'package:trelloapps/pages/board/basic_board_menu.dart';
import 'package:trelloapps/pages/home_page.dart';
import 'package:trelloapps/pages/notifications.dart';
import 'package:trelloapps/pages/start_template.dart';
import 'package:trelloapps/pages/board/boardandhighlight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LandingPage(),
        'homepage': (context) => BoardHomePage(),
        'notifications': (context) => const Notifications(),
        'signup': (context) => const SignupToTrello(),
        'createboard': (context) => const StartWithTemplate(),
        'basicboard': (context) => const BasicBoardPage(),
        'boardmenu': (context) => const BoardMenu(),
        'boardandhighlight': (context) => const BoardAndHighlightPage(),
        'copyboard': (context) => const CopyBoard(),
        'boardsetting': (context) => const BoardSettings(),
        'createboardwithfloat': (context) => CreateBoardScreen(),
      },
    );
  }
}
