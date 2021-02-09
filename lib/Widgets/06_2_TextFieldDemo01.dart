import 'package:flutter/material.dart';

class TextFieldDemo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TextFieldDemo',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('TextFieldDemo')),
            body: _MyStatefulWidget(),
          ),
        )
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  _MyStatefulWidget({Key key}) : super(key: key);
  @override
  __MyStatefulWidgetState createState() => __MyStatefulWidgetState();
}

class __MyStatefulWidgetState extends State<_MyStatefulWidget> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: _controller,
        onSubmitted: (String value) async{
          await showDialog<void>(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: const Text('谢谢！'),
                  content: Text('你输入了$value'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () { Navigator.pop(context); },
                        child: const Text('ok')
                    )
                  ],
                );
              }
          );
        },
      ),
    );
  }
}


