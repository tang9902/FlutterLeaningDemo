import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InternationalDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternationalDemo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('ar', ''), // Arabic, no country code
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // !!! tony，这样写是对的
      home: _Demo(),

      // !!! tony 这样写是错的。为什么？context是组件的上级节点，所以必须要单独写到_Demo组件中。
      // 否则，它的context为null或不含有本地代理实例。
      // home: Material(
      //   child: Scaffold(
      //     appBar: AppBar(title: Text('InternationalDemo')),
      //     body: Container(
      //       child: Text(AppLocalizations.of(context).helloWorld),
      //     ),
      //   ),
      // ),
    );
  }
}

class _Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('InternationalDemo')),
        body: Container(
          child: Text(AppLocalizations.of(context).helloWorld),
        ),
      ),
    );
  }
}



