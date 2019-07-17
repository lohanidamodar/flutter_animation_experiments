import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationTwo extends StatefulWidget {
  _AnimationTwoState createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        // #enddocregion addListener
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
        // #docregion addListener
      });
    // #enddocregion addListener
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}