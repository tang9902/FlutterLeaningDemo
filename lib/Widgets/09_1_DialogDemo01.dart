import 'package:flutter/material.dart';

class DialogDemo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '09_1_DialogDemo',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('09_1_DialogDemo')),
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
      switch (await showDialog<Department>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('Select assignment'),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () { Navigator.pop(context, Department.treasury); },
                  child: const Text('Treasury department'),
                ),
                SimpleDialogOption(
                  onPressed: () { Navigator.pop(context, Department.state); },
                  child: const Text('State department'),
                ),
              ],
            );
          }
      )) {
        case Department.treasury:
          print(Department.treasury.name);
        // Let's go.
        // ...
          break;
        case Department.state:
          print(Department.state.name);

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

class Department {
  static const Department treasury=Department('treasury');
  static const Department state=Department('state');
  final String name;

  const Department(this.name);
}


