import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimateDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '12_1_AnimateDemo',
        home:Material(
          child: Scaffold(
              appBar: AppBar(title: Text('12_1_AnimateDemo')),
              body: LogoApp()
          ),
        )
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
    animation = Tween<double>(begin: 200, end:0).animate(controller)
      ..addListener(() {
        print(animation.status);
        if( animation.isDismissed) {
          controller.forward();
        }else if(animation.isCompleted){
          controller.reverse();
        }
        setState(() {});
      });
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
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: animation.value,
                width: animation.value,
                color: Colors.lightBlue,
                child: ListView(
                  children: [
                    Text('Hello'),
                    Text('Hello'),
                    Text('Hello'),
                    Text('Hello'),
                    Text('Hello'),
                  ],
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

