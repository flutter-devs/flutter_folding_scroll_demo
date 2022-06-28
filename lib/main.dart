import 'package:flutter/material.dart';
import 'package:flutter_folding_scroll_demo/splash_screen.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home:  Splash(),
    );
  }
}

