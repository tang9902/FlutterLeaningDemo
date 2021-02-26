import 'dart:math';
import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 400);
const double sideLen = 350;
double randomBorderRadius() {
  return Random().nextDouble() * 150;
}
double randomMargin() {
  return Random().nextDouble() * 150;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}



class AnimatedContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AnimatedContainerDemo',
        home:Material(
          child: Scaffold(
              appBar: AppBar(title: Text('AnimatedContainerDemo')),
              body: _Demo()
          ),
        )
    );
  }
}

class _Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<_Demo> {
  Color color;
  double borderRadius;
  double margin;

  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
      print(margin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: sideLen,
            height: sideLen,
            child: AnimatedContainer(
              // 这里margin不能太小，不然，easeInOutBack曲线函数在动画过程中有可能得到负值的margin
              margin: EdgeInsets.all(margin<10?10:margin),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              duration: _duration,
              curve: Curves.easeInOutBack,
            ),
          ),
          ElevatedButton(
            child: Text('change'),
            onPressed: () => change(),
          ),
        ],
      ),
    );
  }
}
