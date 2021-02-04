import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/views/HelpView.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/views/HomeView.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/views/LoginView.dart';

class Routes{
  static final Map<String, Function> routes = {
    '/': ()=>MaterialPageRoute(builder: (context)=>HomeView()),
    '/LoginView': ()=>MaterialPageRoute(builder: (context)=>LoginView()),
    '/HelpView': ()=>MaterialPageRoute(builder: (context)=>HelpView()),
  };
}