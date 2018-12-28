import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1731);

    return new Scaffold(body: new Column(children: <Widget>[
      _Phone(),
      getBG(),
      _Pws(),
      getBG(),
      _LoinAndPws(),

      Container(color: Colors.orange,
        margin: EdgeInsets.only(top: 20),
        child: MaterialButton(onPressed: () {
          if (tel.isEmpty || tel.length != 11) {
            Fluttertoast.showToast(msg: "请输入正确手机号");
            return;
          }

          if (pws.isEmpty || pws.length < 6) {
            Fluttertoast.showToast(msg: "密码大于6");
            return;
          }
          _onClick(tel, pws);
          Navigator.pop(context);
        },
          child: new Text(
            "登录", style: TextStyle(fontSize: 18, color: Colors.black),),),
        width: ScreenUtil().setWidth(650),)
    ],),
      appBar: new AppBar(
        backgroundColor: Colors.orange, leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () {
        Navigator.pop(context);
      }),
        centerTitle: true,
        title: new Text(
          "登录", style: TextStyle(fontSize: 18, color: Colors.black),),),);
  }
}

Future _onClick(String tel1,String pws1) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('tel', tel1);
  preferences.setString('pws', pws1);


}

Widget getBG() {
  return new Container(
    height: 1,
    margin: EdgeInsets.only(left: 15, right: 15),
    color: Color.fromRGBO(230, 230, 230, 1),
  );
}

Widget _LoinAndPws() {
  return new Container(child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[

      MaterialButton(child: Text("手机快捷登录"), onPressed: () {},),
      MaterialButton(
        child: Text("忘记密码", style: TextStyle(color: Colors.orange),),
        onPressed: () {},)
    ],),);
}

Widget _Phone() {
  return new Container(height: 60,
    margin: EdgeInsets.only(left: 15),
    child: new Row(children: <Widget>[
      Text("手机号", style: TextStyle(fontSize: ScreenUtil().setSp(30, false)),),
      Flexible(

        child: TextField(
          onChanged: _textFieldTel,
          keyboardType: TextInputType.phone,
          maxLines: 1,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(30, false), color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: InputBorder.none,
            hintText: '请输入你的手机号码',

          ),
        ),)
    ],),);
}

Widget _Pws() {
  return new Container(height: 60,
    margin: EdgeInsets.only(left: 15),
    child: new Row(children: <Widget>[
      Text(
        "密码    ", style: TextStyle(fontSize: ScreenUtil().setSp(30, false)),),
      Flexible(
        child: TextField(
          onChanged: _textFieldPws,
          maxLines: 1,
          obscureText: true,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(30, false), color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: InputBorder.none,
            hintText: '请输入密码',

          ),
        ),)
    ],),);
}

String tel="";
String pws="";

void _textFieldTel(String str) {
  tel = str;
}

void _textFieldPws(String str) {
  pws = str;
}