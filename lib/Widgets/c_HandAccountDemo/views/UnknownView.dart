import 'package:flutter/material.dart';
// 页面主框架
class UnknownView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Text('未知页面'),),
      ),
    );
  }
}