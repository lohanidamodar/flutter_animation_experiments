//Learning to use AnimatedWidget

import 'package:flutter/material.dart';

class AnimationThree extends StatefulWidget {
  @override
  _AnimationThreeState createState() => _AnimationThreeState();
}

class _AnimationThreeState extends State<AnimationThree> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Widget'),
      ),
      body: Center(
        child: AnimatedLogo(animation: animation,child: FlutterLogo(),),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Widget child;
  AnimatedLogo({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: child,
      ),
    );
  }
}