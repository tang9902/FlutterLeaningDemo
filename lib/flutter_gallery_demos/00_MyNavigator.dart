// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_gallery_demos/styled_widget/StyledWidgets.dart';

import '01_MyAppBarDemo.dart';
import '02_MyBannerDemo.dart';
import '03_MyBottomAppBarDemo.dart';
import '04_MyBottomNavigationDemo01.dart';
import '04_MyBottomNavigationDemo02.dart';
import '05_MyPersistentBottomSheetDemo01.dart';
import '05_MyPersistentBottomSheetDemo02.dart';
import '06_MyButtonDemo.dart';
import '07_MyCardsDemo.dart';
import '08_MyChipsDemo.dart';
import '09_MyDataTableDemo.dart';
import '10_MyDialogDemo.dart';
import '11_MyGridListDemo.dart';

class MyNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterGalleryDemos',
      routes: {
        '/': (context)=>_Home(),
        '/MyAppBarDemo': (context)=>MyAppBarDemo(),
        '/MyBannerDemo': (context)=>MyBannerDemo(),
        '/MyBottomAppBarDemo': (context)=>MyBottomAppBarDemo(),
        '/MyBottomNavigationDemo01': (context)=>MyBottomNavigationDemo01(),
        '/MyBottomNavigationDemo02': (context)=>MyBottomNavigationDemo02(),
        '/MyPersistentBottomSheetDemo01': (context)=>MyPersistentBottomSheetDemo01(),
        '/MyPersistentBottomSheetDemo02': (context)=>MyPersistentBottomSheetDemo02(),
        '/MyButtonDemo': (context)=>MyButtonDemo(),
        '/MyCardsDemo': (context)=>MyCardsDemo(),
        '/MyChipsDemo': (context)=>MyChipsDemo(),
        '/MyDataTableDemo': (context)=>MyDataTableDemo(),
        '/MyDialogDemo': (context)=>MyDialogDemo(),
        '/MyGridListDemo': (context)=>MyGridListDemo(),
      },
    );
  }
}
class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('首页'),),
        body: ListView(
          children: [
            ..._getListTile(context, '01_MyAppBarDemo', 'App Bar', '/MyAppBarDemo'),
            ..._getListTile(context, '02_MyBannerDemo', '横幅', '/MyBannerDemo'),
            ..._getListTile(context, '03_MyBottomAppBarDemo', '底部应用栏', '/MyBottomAppBarDemo'),
            ..._getListTile(context, '04_MyBottomNavigationDemo01', '底部导航栏一', '/MyBottomNavigationDemo01'),
            ..._getListTile(context, '04_MyBottomNavigationDemo02', '底部导航栏二', '/MyBottomNavigationDemo02'),
            ..._getListTile(context, '05_MyPersistentBottomSheetDemo01', '底部工作表一', '/MyPersistentBottomSheetDemo01'),
            ..._getListTile(context, '05_MyPersistentBottomSheetDemo02', '底部工作表二', '/MyPersistentBottomSheetDemo02'),
            ..._getListTile(context, '06_MyButtonDemo', '按钮', '/MyButtonDemo'),
            ..._getListTile(context, '07_MyCardsDemo', '卡片', '/MyCardsDemo'),
            ..._getListTile(context, '08_MyChipsDemo', '动作碎片（信息块）', '/MyChipsDemo'),
            ..._getListTile(context, '09_MyDataTableDemo', '数据表', '/MyDataTableDemo'),
            ..._getListTile(context, '10_MyDialogDemo', '对话框', '/MyDialogDemo'),
            ..._getListTile(context, '11_MyGridListDemo', '网格', '/MyGridListDemo'),
          ],
        ),
      ),
    );
  }
}
List<Widget> _getListTile(BuildContext context,String subTitle,String title, String routeName,){
  return [
    Card(
      elevation: 2,
      child: ListTile(
        title:WhiteText(title),
        subtitle:GreyText(subTitle),
        trailing:IconButton(onPressed: ()=>Navigator.pushNamed(context, routeName), icon: Icon(Icons.arrow_forward,color: Colors.white,)),
        tileColor: Colors.green,
      ),
    )
  ];
}

