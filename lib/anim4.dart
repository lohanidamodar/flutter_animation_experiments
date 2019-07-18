//Using animated builder
import 'package:flutter/material.dart';

class AnimationFour extends StatefulWidget {
  @override
  _AnimationFourState createState() => _AnimationFourState();
}

class _AnimationFourState extends State<AnimationFour> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status){
        if(status == AnimationStatus.completed) {
          controller.reverse();
        }else if(status == AnimationStatus.dismissed){
          controller.forward();
        }
      });
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
        child: GrowTransition(animation: animation,child: FlutterLogo(),),
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



class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
                  height: animation.value,
                  width: animation.value,
                  child: child,
                ),
            child: child),
      );
}


class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      );
}