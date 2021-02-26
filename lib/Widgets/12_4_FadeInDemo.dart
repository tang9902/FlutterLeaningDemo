
import 'package:flutter/material.dart';

class FadeInDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FadeInDemo',
        home:Material(
          child: Scaffold(
              appBar: AppBar(title: Text('FadeInDemo')),
              body: _FadeIn()
          ),
        )
    );
  }
}

class _FadeIn extends StatefulWidget {
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<_FadeIn> {
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.asset('assets/2.jpg'),
      TextButton(
          child: Text(
            '显示详情',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => setState((){
            opacity=  opacity== 1?0:1;
          })),
      AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: opacity,
        child: Column(
          children: <Widget>[
            Text('名称: 猫头鹰'),
            Text('年龄: 39'),
            Text('在职: 否'),
          ],
        ),
      )
    ]);
  }
}