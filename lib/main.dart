import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/muscle_game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '野獸先輩 ‧ 臉部臭臭臭',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MuscleGamePage(),
    );
  }
}
