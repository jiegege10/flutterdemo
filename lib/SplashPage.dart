import 'dart:async';
import 'package:flutter/widgets.dart';


class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new Image.asset("images/ic_start_page.png",fit:BoxFit.fill,width: MediaQuery
        .of(context)
        .size
        .width ,height: MediaQuery
        .of(context)
        .size
        .height );
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

// 倒计时
  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, go2HomePage);
  }

  void go2HomePage() {

    Navigator.of(context).pushReplacementNamed('index/Index');
  }
}
