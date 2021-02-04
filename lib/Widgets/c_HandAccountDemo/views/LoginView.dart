import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/routes/Routes.dart';
// 页面主框架
class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Text('登录页面'),),
      ),
    );
  }
}