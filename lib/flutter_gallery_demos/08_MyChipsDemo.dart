// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
class MyChipsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('MyPersistentBottomSheetDemo'),),
        body: ListView(
          children: [
            _ActionChipDemo(),Divider(),
            _ChoiceChipDemo(),Divider(),
            _FilterChipDemo(),Divider(),
            _InputChipDemo(),Divider(),
          ],
        ),
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/

class _ActionChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        onPressed: () {},
        avatar: const Icon(
          Icons.brightness_5,
          color: Colors.black54,
        ),
        label: Text('chipTurnOnLights'),
      ),
    );
  }
}

/*----------------------------------------------------------------------------------------*/

class _ChoiceChipDemo extends StatefulWidget {
  @override
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}
class _ChoiceChipDemoState extends State<_ChoiceChipDemo>
    with RestorationMixin {
  final RestorableInt _indexSelected = RestorableInt(-1);

  @override
  String get restorationId => 'choice_chip_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'choice_chip');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          ChoiceChip(
            label: Text('chipSmall'),
            selected: _indexSelected.value == 0,
            onSelected: (value) {
              setState(() {
                _indexSelected.value = value ? 0 : -1;
              });
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text('chipMedium'),
            selected: _indexSelected.value == 1,
            onSelected: (value) {
              setState(() {
                _indexSelected.value = value ? 1 : -1;
              });
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text('chipLarge'),
            selected: _indexSelected.value == 2,
            onSelected: (value) {
              setState(() {
                _indexSelected.value = value ? 2 : -1;
              });
            },
          ),
        ],
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/
class _FilterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}
class _FilterChipDemoState extends State<_FilterChipDemo> with RestorationMixin {
  final RestorableBool isSelectedElevator = RestorableBool(false);
  final RestorableBool isSelectedWasher = RestorableBool(false);
  final RestorableBool isSelectedFireplace = RestorableBool(false);

  @override
  String get restorationId => 'filter_chip_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(isSelectedElevator, 'selected_elevator');
    registerForRestoration(isSelectedWasher, 'selected_washer');
    registerForRestoration(isSelectedFireplace, 'selected_fireplace');
  }

  @override
  Widget build(BuildContext context) {
    final chips = [
      FilterChip(
        label: Text('chipElevator'),
        selected: isSelectedElevator.value,
        onSelected: (value) {
          setState(() {
            isSelectedElevator.value = !isSelectedElevator.value;
          });
        },
      ),
      FilterChip(
        label: Text('chipWasher'),
        selected: isSelectedWasher.value,
        onSelected: (value) {
          setState(() {
            isSelectedWasher.value = !isSelectedWasher.value;
          });
        },
      ),
      FilterChip(
        label: Text('chipFireplace'),
        selected: isSelectedFireplace.value,
        onSelected: (value) {
          setState(() {
            isSelectedFireplace.value = !isSelectedFireplace.value;
          });
        },
      ),
    ];

    return Center(
      child: Wrap(
        children: [
          for (final chip in chips)
            Padding(
              padding: const EdgeInsets.all(4),
              child: chip,
            )
        ],
      ),
    );
  }
}
/*----------------------------------------------------------------------------------------*/
class _InputChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InputChip(
        onPressed: () {},
        onDeleted: () {},
        avatar: const Icon(
          Icons.directions_bike,
          size: 20,
          color: Colors.black54,
        ),
        deleteIconColor: Colors.black54,
        label: Text('chipBiking'),
      ),
    );
  }
}