import 'package:flutter/material.dart';

class ColorText extends StatelessWidget {
  final String content;
  final Color color;

  const ColorText(this.content, {Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content, style: TextStyle(color: color),);
  }
}

class WhiteText extends StatelessWidget {
  final String content;
  const WhiteText(this.content, {Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorText(content,color: Colors.white);
  }
}
class GreyText extends StatelessWidget {
  final String content;
  const GreyText(this.content, {Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorText(content,color: Colors.black38);
  }
}