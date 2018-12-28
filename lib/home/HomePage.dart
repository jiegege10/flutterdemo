import 'package:flutter/material.dart';
import 'package:flutter_zhuke_app/home/view/CustomTitleBar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {

  ScrollController _mScrollController = new ScrollController();
  GlobalKey<CustomTitleBarState>_mTitleKey = new GlobalKey();
  CustomTitleBarController _mCustomTitleBarController = new CustomTitleBarController();
  bool _isNeedSetAlpha = false;

  @override
  void initState() {
    super.initState();
    _mCustomTitleBarController.value.alpha = 0;
    _mScrollController.addListener(() {
      if (_mScrollController.offset < 80.0) {
        _isNeedSetAlpha = true;
        _mCustomTitleBarController.value.alpha =
            ((_mScrollController.offset / 80) * 255).toInt();
        _mTitleKey.currentState.setState(() {});
      } else {
        if (_isNeedSetAlpha) {
          _mCustomTitleBarController.value.alpha = 255;
          _mTitleKey.currentState.setState(() {});
          _isNeedSetAlpha = false;
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(

            height: MediaQuery
                .of(context)
                .size
                .height,
            child: new Listener(
              onPointerDown: (dd) {},
              onPointerMove: (sss) {},
              onPointerUp: (ss) {},
              onPointerCancel: (s) {},
              child: new SingleChildScrollView(

                controller: _mScrollController,
                child: new Column(

                  children: <Widget>[
                    MyBander(),
                    Memu(),
                    getBG(),
                    videoCard("推荐房源"),
                    getBG(),
                    videoCard("附近房源"),
                    getBG(),
                  videoCard("优质房源"),
                    footview()
                  ],
                ),
              ),
            ),
          ),
          new CustomTitleBar(
            height: 80.0,
            controller: _mCustomTitleBarController,
            key: _mTitleKey,
          ),
        ],
      ),
    );
  }
  Widget footview(){
    return new Container( margin: const EdgeInsets.only(top: 26.0, bottom: 26.0),
    alignment: Alignment.center,
child:  new Image.asset('images/img_bottom.png'));
  }
  Widget Memu() {
    return new Container(
      margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new FlatButton(onPressed: () {
              Fluttertoast.showToast(msg: "地图找房");
              }, child: new Column(

                children: <Widget>[
                  new Image.asset('images/icon_map.png'),
                  new Text(
                      "", style: new TextStyle(fontSize: 10)),
                  new Text("地图找房",
                      style: new TextStyle(fontSize: 12))
                ],)
                ,)),
          new Expanded(
            child: new Column(

              children: <Widget>[
                new Image.asset('images/icon_credit.png'),
                new Text(
                    "", style: new TextStyle(fontSize: 10)),
                new Text(
                    "免押入住", style: new TextStyle(fontSize: 12))
              ],)
            ,),
          new Expanded(
            child: new Column(

              children: <Widget>[
                new Image.asset('images/icon_league.png'),
                new Text(
                    "", style: new TextStyle(fontSize: 10)),
                new Text(
                    "业主加盟", style: new TextStyle(fontSize: 12))
              ],)
            ,),
          new Expanded(

            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                new Image.asset('images/icon_promote.png'),
                new Text(
                    "", style: new TextStyle(fontSize: 10)),
                new Text(
                  "推荐有礼", style: new TextStyle(fontSize: 12),)
              ],)
            ,),
        ],),
    );
  }

  Widget MyBander() {
    return new Container(
      color: Colors.green,
      height: 300.0,
      child: new Center(child: new Swiper(
        autoplayDelay: 3000,
        loop: true,
        autoplay: true,

        pagination: new SwiperPagination(
            margin: new EdgeInsets.fromLTRB(
                0.0, 0.0, 0.0, 30.0),
            builder: new DotSwiperPaginationBuilder(
                color: Colors.white30,
                activeColor: Colors.white,
                size: 10.0,
                activeSize: 10.0)),

        itemBuilder: (context, index) {
          return new Image.network(
            "http://pic24.nipic.com/20121010/3798632_184253198370_2.jpg",
            fit: BoxFit.fill,
          );
        },
        itemCount: 10,
        onTap: (index) => Fluttertoast.showToast(msg: '点击了第$index个'),),),
    );
  }

  Widget getBG() {
    return new Container(
      height: 10.0,
      margin: const EdgeInsets.only(top: 10.0),
      color: Colors.black12,
    );
  }

  Widget videoCard(String name) {
    return new Container(
        child: new Column(
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: new Row(
                  children: <Widget>[

                    new Expanded(
                      child: new Container(
                        child: new Text(
                         name, style: new TextStyle(fontSize: 14.0),),
                      ),
                    ),
                    new Container(
                      child: new FlatButton(
                          onPressed: () {Fluttertoast.showToast(msg: "更多");},
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                "更多", ),
                              new  Icon(Icons.arrow_right),
                            ],
                          )
                      ),
                    )
                  ],
                )
            ),
            new Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    new Container(
                      height: 150,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        margin: const EdgeInsets.only(right: 6.0),
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage(
                                        "https://pic2.zhimg.com/50/v2-5942a51e6b834f10074f8d50be5bbd4d_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(
                                        270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(6.0))
                              ),
                            )
                        )
                    ),
                    new Container(
                        height: 150,
                        margin: const EdgeInsets.only(right: 6.0),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage(
                                        "https://pic3.zhimg.com/50/v2-7fc9a1572c6fc72a3dea0b73a9be36e7_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(
                                        270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(6.0))
                              ),
                            )
                        )
                    ),
                    new Container(
                        height: 150,
                        margin: const EdgeInsets.only(right: 6.0),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage(
                                        "https://pic4.zhimg.com/50/v2-898f43a488b606061c877ac2a471e221_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(
                                        270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(6.0))
                              ),
                            )
                        )
                    ),
                    new Container(
                        height: 150,
                        margin: const EdgeInsets.only(right: 6.0),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage(
                                        "https://pic1.zhimg.com/50/v2-0008057d1ad2bd813aea4fc247959e63_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(
                                        270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(6.0))
                              ),
                            )
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
