import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimateDemo3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AnimateDemo3',
        home:Material(
          child: Scaffold(
              appBar: AppBar(title: Text('AnimateDemo3')),
              body: LogoApp()
          ),
        )
    );
  }
}


class AnimatedLogo extends StatelessWidget {

  AnimatedLogo({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;


  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          height: animation.value,
          width: 200,
          child: child,
        ),
        child: child),
  );
}


class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration:const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 200, end:0).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 250,
            child: Center(
              child: AnimatedLogo(
                animation: animation,
                child: Container(
                  color: Colors.green,
                  child: ListView(
                    children: [
                      Text('abcd'),
                      Text('abcd'),
                      Text('abcd'),
                      Text('abcd'),
                      Text('abcd'),
                    ],
                  ),
                ),
              ),
            )
        ),
        ElevatedButton(onPressed: (){
          if( animation.isDismissed || (animation.status == AnimationStatus.reverse)) {
            controller.forward();
          }else if(animation.isCompleted || (animation.status == AnimationStatus.forward)){
            controller.reverse();
          }
        }, child: Text('Play')),
      ],
    );
  }
}

