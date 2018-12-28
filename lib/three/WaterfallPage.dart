import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WaterfallPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _WaterfallPage();
  }
}

class _WaterfallPage extends State<WaterfallPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: new Text("瀑布流", style: TextStyle(color: Colors.black),),),

      body: new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 18,
        itemBuilder: (BuildContext context, int index) =>
        new Container(
            color: Colors.green,
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),);
  }

}