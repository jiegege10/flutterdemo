import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_zhuke_app/view/menu/drapdown_common.dart';
import 'package:flutter_zhuke_app/view/menu/dropdown_header.dart';
import 'package:flutter_zhuke_app/view/menu/dropdown_list_menu.dart';
import 'package:flutter_zhuke_app/view/menu/dropdown_menu.dart';
import 'package:flutter_zhuke_app/view/menu/dropdown_templates.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SecondPage extends StatefulWidget {

  @override
  _SecondPageState createState() => new _SecondPageState();

}

const List<Map<String, dynamic>> ORDERS = [
  {"title": "综合排序"},
  {"title": "好评优先"},
  {"title": "离我最近"},
  {"title": "人气最高"},
];
const int ORDER_INDEX = 0;

const List<Map<String, dynamic>> TYPES = [
  {"title": "100-500", "id": 0},
  {"title": "500-1000", "id": 1},
  {"title": "1000-1500", "id": 2},
  {"title": "1500-2000", "id": 3},
];
const List<Map<String, dynamic>> TYPESS = [
  {"title": "最新排序", "id": 0},
  {"title": "推荐排序", "id": 1},
  {"title": "价格升序", "id": 2},
  {"title": "价格降序", "id": 3},
];
const int TYPE_INDEX = 2;


const List<Map<String, dynamic>> BUSINESS_CYCLE = [
  {
    "title": "附近",
    "children": [
      {"title": "附近", "distance": 500},
      {"title": "1km", "distance": 1000},
      {"title": "2km", "distance": 2000}
    ]
  },
  {
    "title": "推荐商圈",
    "children": [
      {"title": "中山路", "count": 326},
      {"title": "万达广场", "count": 100},
      {"title": "瑞景", "count": 50}
    ]
  },
  {
    "title": "附近",
    "children": [
      {"title": "附近", "distance": 500},
      {"title": "1km", "distance": 1000},
      {"title": "2km", "distance": 2000}
    ]
  },
  {
    "title": "附近",
    "children": [
      {"title": "附近", "distance": 500},
      {"title": "1km", "distance": 1000},
      {"title": "2km", "distance": 2000}
    ]
  },
];

String FOOD_JSON =
    '[{"title":"附近","children":[{"title":"不限","count":810},{"title":"1000米内","count":463},{"title":"2000米内","count":325},{"title":"3000米内","count":899},{"title":"4000米内","count":325}]},{"title":"区域","children":[{"title":"不限","count":207},{"title":"海沧区","count":425},{"title":"湖里区","count":205},{"title":"翔安区","count":791},{"title":"思明区","count":141},{"title":"同安区","count":163},{"title":"集美区","count":65}]}]';
List FOODS = json.decode(FOOD_JSON);
const int FOOD_INDEX = 1;


class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: buildFixHeaderDropdownMenu(), appBar: new AppBar(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      elevation: 0,

      title: new Row(children: <Widget>[
        new Expanded(child: new Container(
          child: new Text("小区、商圈、地铁站",
              style: new TextStyle(color: Colors.grey, fontSize: 12.0)),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(100.0)),
          padding: EdgeInsets.all(7),)
        ),
        new Container(margin: EdgeInsets.only(left: 5),
          child: new Image.asset("images/icon_location.png"),)

      ],),
    ),);
//    return new Container(child: buildFixHeaderDropdownMenu(),margin:EdgeInsets.only(top: 36.0) ,);
  }

  Widget buildFixHeaderDropdownMenu() {
    return new DefaultDropdownMenuController(
        child: new Column(
          children: <Widget>[
            buildDropdownHeader(),
            new Expanded(
                child: new Stack(
                  children: <Widget>[
                    RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(

                        itemBuilder: _renderRow,
                        itemCount: list.length + 1,
                        controller: _scrollController,
                      ),
                    ),
                    buildDropdownMenu()
                  ],
                ))
          ],
        ));
  }

  List list = new List(); //列表要展示的数据
  ScrollController _scrollController = ScrollController(); //listview的控制器
  int _page = 1; //加载的页数
  bool isLoading = false; //是否正在加载数据
  /**
   * 初始化list数据 加延时模仿网络请求
   */
  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list = List.generate(15, (i) => '厦门市思明区sm城市广场AAAAAA区天地花园 $i 号楼');
      });
    });
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index.isOdd) return new Divider();  //设置分割线

    if (index < list.length) {
//      return ListTile(
//        title: getItem(index),
//      );
      return  new GestureDetector(
        onTap: () {
          //处理点击事件
          Fluttertoast.showToast(msg: "点击了第 $index");
        },
        child: new Container(
//          padding: const EdgeInsets.all(8.0),
          child:  getItem(index),
        ),
      );

    }
    return _getMoreWidget();
  }

  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(

              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  /**
   * 上拉加载更多
   */
  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        setState(() {
          list.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          _page++;
          isLoading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }


  /**
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list = List.generate(20, (i) => '刷新的厦门市思明区sm城市广场AAAAAA区天地花园 $i 号楼');
      });
    });
  }

  Widget getItem(int index) {
    return new Container(
      padding: EdgeInsets.all(10),
      child: new Row(children: <Widget>[
        new Expanded(flex: 1, child: new Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545125662283&di=381711687b1243c57c4be1c166a8840a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F59%2F62%2F56S58PICsh2_1024.jpg",
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2.5,
              height: 120,
              fit: BoxFit.fill,)),),
        new Expanded(flex: 1, child: new Column(children: <Widget>[
          new Container(
            height: 50,
            child: new Text(
              list[index],
              style: new TextStyle(fontSize: 14.0),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,),
            alignment: Alignment.topLeft,
          ),
          new Container(
            height: 20,
            child: new Text(
              "一房一厅", style: new TextStyle(fontSize: 12.0,),),
            alignment: Alignment.topLeft,
          ),
          new Container(
            height: 20,
            child: new Container(
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(3.0)),
              child: new Text(
                "信用租", style: new TextStyle(fontSize: 10.0,),),),
            alignment: Alignment.topLeft,
          ),
          new Container(
            height: 20,
            child: new Text.rich(new TextSpan(text: "6000",
                style: new TextStyle(fontSize: 18.0, color: Colors.red),
                children: <TextSpan>[
                  new TextSpan(text: "元/月",
                      style: new TextStyle(fontSize: 12.0, color: Colors.red))
                ])),
            alignment: Alignment.bottomRight,
          )


        ],),)

      ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,),);
  }

  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(maxMenuHeight: kDropdownMenuItemHeight * 10,
        //  activeIndex: activeIndex,
        menus: [
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownTreeMenu(
                  selectedIndex: 0,
                  subSelectedIndex: 0,
                  itemExtent: 45.0,
//                  background: Colors.red,
//                  subBackground: Colors.blueAccent,
                  itemBuilder:
                      (BuildContext context, dynamic data, bool selected) {
                    if (!selected) {
                      return new DecoratedBox(
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: Divider.createBorderSide(context))),
                          child: new Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: new Row(
                                children: <Widget>[
                                  new Text(data['title']),
                                ],
                              )));
                    } else {
                      return new DecoratedBox(
                          decoration: new BoxDecoration(
                              border: new Border(
                                  top: Divider.createBorderSide(context),
                                  bottom: Divider.createBorderSide(context))),
                          child: new Container(
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor,
                              child: new Row(
                                children: <Widget>[
                                  new Container(
                                      color: Theme
                                          .of(context)
                                          .primaryColor,
                                      width: 3.0,
                                      height: 20.0),
                                  new Padding(
                                      padding: new EdgeInsets.only(left: 12.0),
                                      child: new Text(data['title'])),
                                ],
                              )));
                    }
                  },
                  subItemBuilder:
                      (BuildContext context, dynamic data, bool selected) {
                    Color color = selected
                        ? Theme
                        .of(context)
                        .primaryColor
                        : Theme
                        .of(context)
                        .textTheme
                        .body1
                        .color;

                    return new Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10.0),
                      height: 45.0,

                      child:
                      new Text(

                        data['title'],
                        style: new TextStyle(color: color),
                      ),
                    );
                  },
                  getSubData: (dynamic data) {
                    return data['children'];
                  },
                  data: FOODS,
                );
              },
              height: 450.0),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPES.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPESS,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPESS.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: ORDER_INDEX,
                  data: ORDERS,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * ORDERS.length),

        ]);
  }

  DropdownHeader buildDropdownHeader({DropdownMenuHeadTapCallback onTap}) {
    return new DropdownHeader(
      onTap: onTap,
      titles: ["区域", "价格", "推荐排序", "更多筛选"],
    );
  }

}