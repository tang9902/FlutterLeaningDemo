// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
class MyButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('MyPersistentBottomSheetDemo'),),
        body: ListView(
          children: [
            _TextButtonDemo(),
            Divider(),
            _ElevatedButtonDemo(),
            Divider(),
            _OutlinedButtonDemo(),
            Divider(),
            _ToggleButtonsDemo(),
            Divider(),
            _FloatingActionButtonDemo(),
          ],
        ),
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/
class _TextButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            child: Text('buttonText'),
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            icon: const Icon(Icons.add, size: 18),
            label: Text('buttonText'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/
class _ElevatedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            child: Text('buttonText'),
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.add, size: 18),
            label: Text('buttonText'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/
class _OutlinedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            child: Text('buttonText'),
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.add, size: 18),
            label: Text('buttonText'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/
class _ToggleButtonsDemo extends StatefulWidget {
  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}
class _ToggleButtonsDemoState extends State<_ToggleButtonsDemo> with RestorationMixin {
  final isSelected = [
    RestorableBool(false),
    RestorableBool(true),
    RestorableBool(false),
  ];

  @override
  String get restorationId => 'toggle_button_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(isSelected[0], 'first_item');
    registerForRestoration(isSelected[1], 'second_item');
    registerForRestoration(isSelected[2], 'third_item');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        children: const [
          Icon(Icons.ac_unit),
          Icon(Icons.call),
          Icon(Icons.cake),
        ],
        onPressed: (index) {
          setState(() {
            isSelected[index].value = !isSelected[index].value;
          });
        },
        isSelected: isSelected.map((element) => element.value).toList(),
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/
class _FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
            tooltip: 'buttonTextCreate',
          ),
          const SizedBox(height: 20),
          FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: Text('buttonTextCreate'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}