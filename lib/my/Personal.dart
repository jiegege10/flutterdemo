import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zhuke_app/Login.dart';
import 'package:flutter_zhuke_app/my/PersonalSet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Personal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalState();
  }
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1731)
      ..init(context);
    return new Scaffold(
      body: new SingleChildScrollView(child: new Column(children: <Widget>[
        _Title(),
        _Bg(),
        _Menu(),
        _Bg1(),
        _Menu(),
        _Bg1(),
        _Menu(),
        _Bg(),
        _ItemTitle()
      ],)),
      appBar: new AppBar(backgroundColor: Colors.orange,
        elevation: 0,
        title: new FlatButton(onPressed: () {
          _readShared(context);
        }, child: new Text("设置", style: TextStyle(
            fontSize: ScreenUtil().setSp(38, false),
            color: Colors.black),)),),);
  }
}

Future _readShared(BuildContext context) async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  String tel = preferences.get('tel');
  String pws = preferences.get('pws');

  if (tel==null && pws==null) {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return new Login();
        }
    ));
  } else {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return new PersonalSet();
        }
    ));
  }
}

Widget _Bg1() {
  return new Container(color: Color.fromRGBO(230, 230, 230, 1),
    height: 1,
    width: ScreenUtil().setWidth(750),);
}

Widget _Bg() {
  return new Container(color: Color.fromRGBO(230, 230, 230, 1),
    height: 10,
    width: ScreenUtil().setWidth(750),);
}

Widget _Menu() {
  return new Row(children: <Widget>[
    new Expanded(
        flex: 1, child: new Column(children: <Widget>[
      new Icon(Icons.list),
      new Text("我的约看")
    ],)),
    new Container(
      width: 1.0, height: 100, color: Color.fromRGBO(230, 230, 230, 1),),
    new Expanded(
        flex: 1, child: new Column(children: <Widget>[
      new Icon(Icons.list),
      new Text("我的约看")
    ],)),
    new Container(
      width: 1.0, height: 100, color: Color.fromRGBO(230, 230, 230, 1),),
    new Expanded(
        flex: 1, child: new Column(children: <Widget>[
      new Icon(Icons.list),
      new Text("我的约看")
    ],)),
  ],);
}

Widget _ItemTitle() {
  return new Column(children: <Widget>[
    new Container(
      alignment: Alignment.centerLeft,
      child: new Text(
        "客服咨询", style: TextStyle(fontSize: ScreenUtil().setSp(28, false)),),
      height: 60.0,
      padding: EdgeInsets.only(left: 15),)
    , _Bg1(),
    new Container(
      alignment: Alignment.centerLeft,
      child: new Text(
        "关于我们", style: TextStyle(fontSize: ScreenUtil().setSp(28, false)),),
      height: 60.0,
      padding: EdgeInsets.only(left: 15),)
    , _Bg1()
    , new Container(
      alignment: Alignment.centerLeft,
      child: new Text(
        "邀请好友", style: TextStyle(fontSize: ScreenUtil().setSp(28, false)),),
      height: 60.0,
      padding: EdgeInsets.only(left: 15),)
    , _Bg1()
    , new Container(
      alignment: Alignment.centerLeft,
      child: new Text(
        "意见反馈", style: TextStyle(fontSize: ScreenUtil().setSp(28, false)),),
      height: 60.0,
      padding: EdgeInsets.only(left: 15),)
    , _Bg1()
    , new Container(
      alignment: Alignment.centerLeft,
      child: new Text(
        "五星好评", style: TextStyle(fontSize: ScreenUtil().setSp(28, false)),),
      height: 60.0,
      padding: EdgeInsets.only(left: 15),)

  ],);
}

Widget _Title() {
  return new Container(
    padding: EdgeInsets.only(bottom: 20.0),
    decoration: new BoxDecoration(color: Colors.orange),
    child: new Row(children: <Widget>[
      Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(30)),
        height: ScreenUtil().setWidth(140),
        width: ScreenUtil().setWidth(140),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/icon_photo.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(200.0),
          ),
        ),
      ),
      new Container(margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
        child:
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start, //左对齐
          children: <Widget>[
            new Container(
              child: new Text(
                "猪客",
                style: new TextStyle(fontSize: ScreenUtil().setSp(36, false),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,),
              alignment: Alignment.topLeft,
            ),
            new Container(
              margin: EdgeInsets.only(top: 5.0),
              child: new Text(
                "账户余额：10000",
                style: new TextStyle(fontSize: ScreenUtil().setSp(28, false)),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,),
              alignment: Alignment.topLeft,
            ),
          ],),),
    ],),);
}