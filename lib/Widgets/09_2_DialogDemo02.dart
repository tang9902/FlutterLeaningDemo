import 'package:flutter/material.dart';

class DialogDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DialogDemo02',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('DialogDemo02')),
            body: _Demo(),
          ),
        )
    );
  }
}

class _Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _askedToLead() async {
      switch (await showDialog<int>(
          context: context,
          builder: (BuildContext context) {
            return _DialogContainer();
          }
      )) {
        case 1:
          print(1);
        // Let's go.
        // ...
          break;
        case 2:
          print(2);

          // ...
          break;
      }
    }
    return Container(
      child: ElevatedButton(
        onPressed: _askedToLead,
        child: Text('显示对话框'),
      ),
    );
  }
}


class _DialogContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('XX对话框'),
      children: <Widget>[
        ElevatedButton(
          onPressed: () { Navigator.pop(context, 1); },
          child: const Text('1'),
        ),
        ElevatedButton(
          onPressed: () { Navigator.pop(context, 2); },
          child: const Text('2'),
        ),
      ],
    );
  }
}



