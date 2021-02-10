import 'package:flutter/material.dart';

class DialogDemo03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DialogDemo03',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('DialogDemo03')),
            body: _Demo(),
          ),
        )
    );
  }
}

class _Demo extends StatelessWidget {
  void _openDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _DialogContainer();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
          onPressed: ()=>_openDialog(context),
          child: Text('显示对话框'),
        )
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



