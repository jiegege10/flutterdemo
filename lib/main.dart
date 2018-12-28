import 'package:flutter/material.dart';
import 'package:flutter_zhuke_app/SplashPage.dart';
import 'package:flutter_zhuke_app/index/Index.dart';

void main() =>

    runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(title: "FlutterDemo",    debugShowCheckedModeBanner: false,home: new SplashPage(),routes: <String, WidgetBuilder>{ // 路由
      'index/Index': (BuildContext context) => new Index()
    } ,);}

}
