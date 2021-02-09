import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBarDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('TabBarDemo')),
          body: _Tabs(),
        ),
      )
    );
  }
}

class _Tabs extends StatefulWidget {
  // 1 声明myTabs
  final List<Tab> myTabs;

  // 2 声明children页面
  final List<Widget> children;

  const _Tabs({Key key, @required this.myTabs, @required this.children}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

// 3 with SingleTickerProviderStateMixin vsync的参数类型
class _TabsState extends State<_Tabs> with SingleTickerProviderStateMixin {
  // 4 声明_tabController
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 5 初始化_tabController
    _tabController = TabController(length: widget.myTabs.length, vsync: this);
  }

  // 6 释放_tabController
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 6 TabBar
        TabBar(
          controller: _tabController,
          tabs: widget.myTabs,
          labelColor: Colors.red,
        ),
        // 7 TabBarView
        Container(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: widget.children,
          ),
        )
      ],
    );
  }
}
