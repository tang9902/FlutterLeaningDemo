import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  // 1 声明myTabs
  final List<Tab> myTabs;

  // 2 声明children页面
  final List<Widget> children;

  final double tabViewHight;

  const Tabs({Key key, @required this.myTabs, @required this.children,  @required this.tabViewHight}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

// 3 with SingleTickerProviderStateMixin vsync的参数类型
class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
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
          labelColor: Colors.black87,
        ),
        // 7 TabBarView
        Container(
          height: widget.tabViewHight,
          child: TabBarView(
            controller: _tabController,
            children: widget.children,
          ),
        )
      ],
    );
  }
}
