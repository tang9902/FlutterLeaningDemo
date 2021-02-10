import 'package:flutter/material.dart';

typedef void OnChangedCallBack(int newValue);

class CustomDropDown extends StatefulWidget {
  final Map<int,String> options;
  final OnChangedCallBack onChangedCallBack;
  final int initValue;

  CustomDropDown({Key key, @required this.options,@required this.onChangedCallBack, this.initValue}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  int _value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = widget.initValue == null?widget.options.entries.first.key:widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      isExpanded: true,
      value: _value,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(height: 1,color: Colors.black38,),
      onChanged: (newValue){
        setState(() {
          _value = newValue;
          widget.onChangedCallBack(newValue);
        });
      },
      items:widget.options.entries.map((mapEntry){
        return DropdownMenuItem<int>(
            value: mapEntry.key,
            child: Text(mapEntry.value)
        );
      }).toList(),
    );
  }
}

