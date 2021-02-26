import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimateDemo2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AnimateDemo2',
        home:Material(
          child: Scaffold(
              appBar: AppBar(title: Text('AnimateDemo2')),
              body: LogoApp()
          ),
        )
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
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
              child: AnimatedLogo(animation: animation,),
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

