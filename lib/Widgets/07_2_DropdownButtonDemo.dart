import 'package:flutter/material.dart';

class DropdownButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DropdownButtonDemo',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('DropdownButtonDemo')),
            body: _MyDemo(),
          ),
        )
    );
  }
}
class _MyDemo extends StatefulWidget {
  _MyDemo({Key key}) : super(key: key);
  @override
  _MyDemoState createState() => _MyDemoState();
}

class _MyDemoState extends State<_MyDemo> {
  String _value = 'One';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: _value,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepOrange),
        underline: Container(height: 2,color: Colors.deepOrangeAccent,),
        onChanged: (String newValue){
          setState(() {
            _value = newValue;
          });
        },
        items:<String>['One','Two','Three','Four']
          .map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(
                value: value,
                child: Text(value)
            );
        }).toList(),
      ),
    );
  }
}





