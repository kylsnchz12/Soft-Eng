import 'package:flutter/material.dart';
import 'package:soft_eng/finder_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Deck',
      theme: ThemeData(),
      home: const FinderPage(),
    );
  }
}
