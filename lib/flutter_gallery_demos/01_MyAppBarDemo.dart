// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class MyAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AppBarDemo(),
    );
  }
}

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          'demoAppBarTitle',
        ),
        actions: [
          IconButton(
            tooltip: '我的最爱',
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          IconButton(
            tooltip: '搜索',
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    '菜单1',
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    '菜单2',
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    '菜单3',
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          '内容',
        ),
      ),
    );
  }
}

