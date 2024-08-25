import 'package:flutter/material.dart';
import 'package:ulangan_harian_balok/scaffold_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volume & Luas Balok',
      home: ScaffoldWidget(),
    );
  }
}
