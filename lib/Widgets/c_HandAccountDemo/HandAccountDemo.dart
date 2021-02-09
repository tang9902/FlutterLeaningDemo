import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/routes/Routes.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/views/UnknownView.dart';
import 'package:provider/provider.dart';

import 'models/AccountRecord.dart';
// 页面主框架
class HandAccountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        var model = AccountRecord();
        model.fetchMapListAndNotify();
        return model;
      },
      child: MaterialApp(
        title: '手帐小管家', // used by the OS task switcher
        onGenerateRoute: (setting){
          String routeKey = setting.name;
          if(Routes.routes.containsKey(routeKey)){
            return Routes.routes[routeKey]();
          }
          return MaterialPageRoute(builder: (context)=>UnknownView());
        },
      ),
    );
  }
}