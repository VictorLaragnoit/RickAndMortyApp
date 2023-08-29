import 'package:flutter/material.dart';
import 'package:rickmorty/pages/characters_list.dart';
import 'package:rickmorty/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Rick and Morty Font',
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
