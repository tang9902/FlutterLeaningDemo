import 'package:flutter/material.dart';

class TestInheritedWidgetRebuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestInheritedWidgetRebuild',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('TestInheritedWidgetRebuild')),
          body: MyRoot(),
        ),
      )
    );
  }
}

class MyRoot extends StatefulWidget {
  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  String rootText = 'Hello';
  void _update(){
    setState(() {
      rootText += 'b';
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyRoot重构子树');
    return Column(
      children: [
        Text(rootText),
        ElevatedButton(onPressed: _update, child: Text('rootText .+=b:' + rootText),),
        _InheritedContainer()
      ],
    );
  }
}



class _InheritedContainer extends StatefulWidget {
  @override
  _InheritedContainerState createState() => _InheritedContainerState();
}

class _InheritedContainerState extends State<_InheritedContainer> {
  int _id = 1;
  void _updateID(){
    setState(() {
      print('_InheritedContainerState: _id++');
      _id++;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('_InheritedContainerState:_________didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant _InheritedContainer oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('_InheritedContainerState:_________didUpdateWidget');
  }
  @override
  Widget build(BuildContext context) {
    print('_InheritedContainer重构子树');
    return MyInheritedWidget(
        id:_id,
        child: Column(
          children: [
            MyChildButton(onPressCallBack: _updateID),
            MyChildText(),
            //Opacity(opacity: 0.8,child: Container(color: Colors.red,child: Text('透明度'),),),
            MyChildSWidget()
          ],
        )
    );
  }
}

class MyInheritedWidget extends InheritedWidget{
  final int id;

  MyInheritedWidget({Key key, @required this.id, @required Widget child}) : super(key: key, child: child){
   print('构建MyInheritedWidget');
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    // print('updateShouldNotify： ${id != oldWidget.id}');
    return id != oldWidget.id;
    // return false;
  }

  // 实现一个静态方法来获取自己的实例
  static MyInheritedWidget of(BuildContext context) {
    print('查询MyInheritedWidget实例');
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

}

class MyChildButton extends StatelessWidget {
  final Function onPressCallBack;

  const MyChildButton({Key key, @required this.onPressCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyChildButton重构子树');
    return Container(
      child: ElevatedButton(onPressed: ()=>onPressCallBack(),child: Text('id++'),),
    );
  }
}
class MyChildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyInheritedWidget myInheritedWidget = MyInheritedWidget.of(context);
    print('MyChildText重构子树');
    return Container(
      child: Text('MyInheritedWidget:id:' + myInheritedWidget.id.toString())
    );
  }
}
class MyChildSWidget extends StatefulWidget {
  @override
  _MyChildSWidgetState createState() => _MyChildSWidgetState();
}

class _MyChildSWidgetState extends State<MyChildSWidget> {
  int _id;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('_MyChildSWidgetState_______didChangeDependencies');
    setState(() {
      MyInheritedWidget myInheritedWidget = MyInheritedWidget.of(context);
      _id = myInheritedWidget.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_MyChildSWidgetState build子树');
    return Container(child: Text('myInheritedWidget.id：' + _id.toString()),);
  }
}

