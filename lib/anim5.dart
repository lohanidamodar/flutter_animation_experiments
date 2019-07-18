//animated bottom bar
import 'package:flutter/material.dart';

class AnimationFive extends StatefulWidget {
  final List<BarItem> items  = [
    BarItem(icon: Icons.home,title: "Home", color: Colors.indigo),
    BarItem(icon: Icons.favorite_border,title: "Likes", color: Colors.pinkAccent),
    BarItem(icon: Icons.search,title: "Search", color: Colors.yellow.shade900),
    BarItem(icon: Icons.person_outline,title: "Profile", color: Colors.teal),
  ];
  @override
  _AnimationFiveState createState() => _AnimationFiveState();
}

class _AnimationFiveState extends State<AnimationFive> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: widget.items[selectedIndex].color,
        child: Center(
          child: Text("Selected $selectedIndex", style: TextStyle(
            color: Colors.white,
            fontSize: 18.0
          ),),
        ),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        items: widget.items,
        animationDuration: const Duration(milliseconds: 200),
        onBarTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        }
      ),
    );
  }
}

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> items;
  final Duration animationDuration;
  final void Function(int) onBarTap;
  const AnimatedBottomBar({Key key, this.items, this.animationDuration = const Duration(milliseconds: 500), this.onBarTap}) : super(key: key);
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  AnimationController _controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
      
    );
  }

  List<Widget> _buildBarItems() {
    return widget.items.map((item) {
      int index = widget.items.indexOf(item);
      bool isSelected = index == selectedIndex;
      return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          widget.onBarTap(index);
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0,),
          decoration: BoxDecoration(
            color: isSelected ? item.color.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          duration: widget.animationDuration,
          child: Row(
          children: <Widget>[
            Icon(item.icon, color: isSelected ? item.color : Colors.black,),
            const SizedBox(width: 10.0),
            AnimatedSize(
              vsync: this,
              curve: Curves.easeIn,
              duration: widget.animationDuration,
              child: Text(isSelected ? item.title : "", style: TextStyle(
                color: item.color,
                fontSize: 16.0,
                fontWeight: FontWeight.w600
              ),),
            )
          ],
      ),
        ));
    }).toList();
  }
}


class BarItem {
  final String title;
  final IconData icon;
  final Color color;

  BarItem({this.title,this.icon, this.color});
}