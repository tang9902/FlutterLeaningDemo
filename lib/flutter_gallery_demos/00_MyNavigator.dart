// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '01_MyAppBarDemo.dart';
import '02_MyBannerDemo.dart';
import '03_MyBottomAppBarDemo.dart';
import '04_MyBottomNavigationDemo.dart';
import '05_MyPersistentBottomSheetDemo.dart';

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
        '/MyBottomNavigationDemo': (context)=>MyBottomNavigationDemo(),
        '/MyPersistentBottomSheetDemo': (context)=>MyPersistentBottomSheetDemo(),
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
              ListTile(title: Text('01_MyAppBarDemo'), trailing:IconButton(onPressed: ()=>Navigator.pushNamed(context, '/MyAppBarDemo'), icon: Icon(Icons.arrow_forward)),tileColor: Colors.white,),Divider(thickness: 1,),
              ListTile(title: Text('02_MyBannerDemo'), trailing:IconButton(onPressed: ()=>Navigator.pushNamed(context, '/MyBannerDemo'), icon: Icon(Icons.arrow_forward)),tileColor: Colors.white,),Divider(thickness: 1,),
              ListTile(title: Text('03_MyBottomAppBarDemo'), trailing:IconButton(onPressed: ()=>Navigator.pushNamed(context, '/MyBottomAppBarDemo'), icon: Icon(Icons.arrow_forward)),tileColor: Colors.white,),Divider(thickness: 1,),
              ListTile(title: Text('04_MyBottomNavigationDemo'), trailing:IconButton(onPressed: ()=>Navigator.pushNamed(context, '/MyBottomNavigationDemo'), icon: Icon(Icons.arrow_forward)),tileColor: Colors.white,),Divider(thickness: 1,),
              ListTile(title: Text('05_MyPersistentBottomSheetDemo'), trailing:IconButton(onPressed: ()=>Navigator.pushNamed(context, '/MyPersistentBottomSheetDemo'), icon: Icon(Icons.arrow_forward)),tileColor: Colors.white,),Divider(thickness: 1,),
            ],
          ),
        ),
    );
  }
}


