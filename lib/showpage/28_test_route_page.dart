import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P28RoutePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage();
  }
}

class _MaterialPage extends State<P28RoutePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text("pushName-sub1,普通"),
            onPressed: () {
              Navigator.of(context).pushNamed('/sub1', arguments: {
                "title": "透传title",
                "name": 'postbird',
                'passw': '123456'
              });
            },
          ),
          FlatButton(
            child: Text("pushName-sub2,子页面与此同级"),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/sub2', arguments: {
                "title": "透传title",
                "name": 'postbird',
                'passw': '123456'
              });
            },
          ),
        ],
      ),
    );
  }
}

class P28RoutePageSub1 extends StatelessWidget {
  final Map sub1Map;

  P28RoutePageSub1({Key key, this.sub1Map}) : super(key: key) {
    print(this.sub1Map);
  }

  @override
  Widget build(BuildContext context) {
    String tmp = ModalRoute.of(context).settings.arguments.toString();
    String tmp2 = this.sub1Map.toString();

    print("tmp== $tmp");
    print("tmp2== $tmp2");

    return Scaffold(
      appBar: AppBar(
        title: Text("路由-sub1"),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}

class P28RoutePageSub2 extends StatelessWidget {
  final Map sub2Map;

  P28RoutePageSub2({Key key, this.sub2Map}) : super(key: key) {
    print(this.sub2Map);
  }

  @override
  Widget build(BuildContext context) {
    /// 上下文获得参数
    String tmp = ModalRoute.of(context).settings.arguments.toString();
    String tmp2 = this.sub2Map.toString();

    print("tmp== $tmp");
    print("tmp2== $tmp2");

    return Scaffold(
      appBar: AppBar(
        title: Text("路由-sub2"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.red,
//            width: double.infinity-100,
//            height: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text(
              '内容1',
              style: TextStyle(backgroundColor: Colors.greenAccent),
            ),
          ),
          Container(
            color: Colors.red,
//            width: double.infinity-100,
//            height: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text(
              '内容2',
              style: TextStyle(backgroundColor: Colors.greenAccent),
            ),
          ),
        ],
      ),
    );
  }
}
