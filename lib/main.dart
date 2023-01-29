import 'package:flutter/material.dart';
import 'package:tictok_clone/%08features/main_navigation/main_navigation_screen.dart';
import 'package:tictok_clone/constants/sizes.dart';

void main() {
  runApp(const TicTokApp());
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTok Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            )),
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
