import 'package:animationtest/anim1.dart';
import 'package:animationtest/anim2.dart';
import 'package:animationtest/anim3.dart';
import 'package:flutter/material.dart';

import 'anim4.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        'anim1' : (_) => AnimationOne(),
        'anim2' : (_) => AnimationTwo(),
        'anim3' : (_) => AnimationThree(),
        'anim4' : (_) => AnimationFour(),
      },
    );
  }
}

