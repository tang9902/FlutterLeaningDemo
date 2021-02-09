import 'package:flutter/material.dart';
// 页面主框架
class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 100,left: 100,right: 100),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book,color: Colors.blueAccent,),
                    Text('手帐小管家'),
                  ],
                ),
                SizedBox(height: 50,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '用户名',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '密码',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  child: Text('登录'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                )
              ],
            )),
      ),
    );
  }
}