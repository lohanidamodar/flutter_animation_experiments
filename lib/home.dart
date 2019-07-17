import 'package:flutter/material.dart'; 
import 'dart:math' as math;

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'anim1'),
              child: Text("1. Show Hide on Click"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'anim2'),
              child: Text("2. Reveal animation"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'anim3'),
              child: Text("3. Animated widget"),
            ),
          ],
        ),
      ),
    );
  }
}