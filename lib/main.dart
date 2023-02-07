import 'package:flutter/material.dart';
import 'package:flutter_minecraft/constraints.dart';
import 'package:flutter_minecraft/game_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Minecraft',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: Builder(builder: (context) {
        gameConstraints.setContext(context);
        return const GamePage();
      }),
    );
  }
}
