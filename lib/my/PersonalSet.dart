import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalSet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PersonalSet();
  }

}

class _PersonalSet extends State<PersonalSet> {
  var _aaa = "123123213";
  bool ishow = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1731);
    var width30 = ScreenUtil().setWidth(30);
    var pading = EdgeInsets.only(left:width30);
    return new Scaffold(appBar: new AppBar(backgroundColor: Colors.white,
      elevation: 0,
      leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () {
        Navigator.pop(context);
      }),
      title: new Text("个人设置", style: TextStyle(color: Colors.black),),
    ), body: new SingleChildScrollView(child: new Column(children: <Widget>[
      new Container(
        child: new Text("账号与密码"),
        width: ScreenUtil().setWidth(750),
        color: Colors.black12,
        height: 40.0,
        alignment: Alignment.centerLeft,
        padding: pading,),
      new Row(children: <Widget>[
        new Expanded(
          child: new Container(child: new Text("绑定手机"),
            height: 60,
            alignment: Alignment.centerLeft,
            padding: pading,),
          flex: 1,),
        new Container(

          height: 20,
          padding: EdgeInsets.only(right:width30),
          child: new Text("$_aaa  >"),
          alignment: Alignment.centerRight,
        )
      ],),
      _Bg1(),
      new Row(children: <Widget>[
        new Expanded(
          child: new Container(child: new Text("绑定邮箱"),
            height: 60,
            alignment: Alignment.centerLeft,
            padding: pading,),
          flex: 1,),
        new Container(
          height: 20,
          padding: EdgeInsets.only(right:width30),
          child: new Text("请绑定  >"),
          alignment: Alignment.centerRight,
        )
      ],),
      _Bg1(),
      new Row(children: <Widget>[
        new Expanded(
          child: new Container(child: new Text("修改密码"),
            height: 60,
            alignment: Alignment.centerLeft,
            padding: pading,),
          flex: 1,),
        new Container(
          height: 20,
          padding: EdgeInsets.only(right:width30),
          child: new Text(">"),
          alignment: Alignment.centerRight,
        )
      ],),
      _Bg1(),
      new Container(
        child: new Text("个人资料"),
        width: ScreenUtil().setWidth(750),
        color: Colors.black12,
        height: 40.0,
        alignment: Alignment.centerLeft,
        padding: pading,),
      new Row(children: <Widget>[
        new Expanded(
          child: new Container(child: new Text("头像"),
            height: 60,
            alignment: Alignment.centerLeft,
            padding: pading,),
          flex: 1,),
        new Container(
          height: 20,
          padding: EdgeInsets.only(right:width30),
          child: new Text("18000000000"),
          alignment: Alignment.centerRight,
        )
      ],),
      _Bg1(),
      new Row(children: <Widget>[
        new Expanded(
          child: new Container(child: new Text("真实名字"),
            height: 60,
            alignment: Alignment.centerLeft,
            padding: pading,),
          flex: 1,),
        new Container(
          height: 20,
          padding: EdgeInsets.only(right:width30),
          child: new Text("去实名认证  >"),
          alignment: Alignment.centerRight,
        )
      ],),
      _Bg1(),
      new Row(children: <Widget>[
        new Expanded(
          child: new Container(child: new Text("昵称"),
            height: 60,
            alignment: Alignment.centerLeft,
            padding: pading,),
          flex: 1,),
        new Container(
          height: 20,
          padding: EdgeInsets.only(right:width30),
          child: new Text("杰哥  >"),
          alignment: Alignment.centerRight,
        )
      ],),
      _Bg1(),
      new Row(children: <Widget>[
        new Expanded(
          child: new Container(
            child: new Text("性别"),
            height: 60,
            alignment: Alignment.centerLeft,
            padding: pading,),
          flex: 1,),
        new Container(
          height: 20,
          padding: EdgeInsets.only(right:width30),
          child: new Text("男  >"),
          alignment: Alignment.centerRight,
        )
      ],),
      new Container(color: Color.fromRGBO(230, 230, 230, 1),
        height: 60,
        width: ScreenUtil().setWidth(750),),

      _getTuiChu()
    ],),),);
  }

  Widget _getTuiChu() {
    return new Container(margin: EdgeInsets.only(top: 30.0), child: FlatButton(
      child: Container(
        color: Colors.orange,
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(750),
        height: 44.0,
        child: Text(
          "退出登录",
          style: TextStyle(fontSize: ScreenUtil().setSp(32, false)),),),
      onPressed: () {
        showDialog(barrierDismissible: ishow,

            context: context,
            builder: (BuildContext context) {
              return new SimpleDialog(
                contentPadding: EdgeInsets.all(10.0),

                title: new Text('是否退出', textAlign: TextAlign.center),
                children: <Widget>[
                  new Text('退出后将重新登录', textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0)),
                  new Container(margin: EdgeInsets.only(top: 20.0), child:
                  new Row(children: <Widget>[
                    new Expanded(
                      child: new FlatButton(onPressed: () {
                        Navigator.pop(context);
                        _removeShared();
//                    ishow = true;
                      }, child: new Text("确定", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0)),), flex: 1,),
                    new Expanded(
                        child: new Text("取消", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0),), flex: 1)
                  ],),)
                ],
              );
            });
//
      },),);
  }

  _string() async {
    SharedPreferences preferences = await SharedPreferences
        .getInstance();
    _aaa = preferences.getString('tel');
  }

  /*
   * 删除数据
   */
  Future _removeShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('tel');
    preferences.remove('pws');
    Navigator.pop(context);
  }

}

Widget _Bg1() {
  return new Container(color: Color.fromRGBO(230, 230, 230, 1),
    height: 1,
    width: ScreenUtil().setWidth(750),);
}
