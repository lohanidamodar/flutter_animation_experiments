import 'package:flutter/material.dart'; 
import 'dart:math' as math;

class AnimationOne extends StatefulWidget {
  @override
  _AnimationOneState createState() => _AnimationOneState();
}

class _AnimationOneState extends State<AnimationOne> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() { 
    super.initState();
    _controller=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200)
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ScaleTransition(
              scale: CurvedAnimation(
                curve: Interval(0.0, 1.0, curve: Curves.easeOut),
                parent: _controller
              ),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.red,
              ),
            ),
            FloatingActionButton(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationZ(_controller.value * .5 * math.pi),
                    child: Icon(_controller.isDismissed ? Icons.play_arrow : Icons.close)
                  );
                },
              ),
              onPressed: (){
                if(_controller.isDismissed)
                  _controller.forward();
                else
                  _controller.reverse();
              },
            )
          ],
        ),
      ),
    );
  }
}