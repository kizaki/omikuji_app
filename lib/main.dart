import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'おみくじアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'おみくじアプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image image; // 中央に表示する画像

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: new Stack(children: <Widget>[
        /*
        new Image.asset(
          "images/top.png",
          fit: BoxFit.fitWidth, // 横幅を画面に合わせる
          alignment: new Alignment(0.0, -0.5),
          //alignment: AlignmentDirectional.topCenter, // 中央上部に配置
        ),
        */
        image = new Image.asset("images/top.png",
            fit: BoxFit.fitWidth, alignment: new Alignment(0.0, -0.5)),
        new Align(
          alignment: new Alignment(0.0, 0.9),
          child: Container(
            margin: new EdgeInsets.only(bottom: 0.0),
            child: new RaisedButton(
              onPressed: () {
                setState(() {
                  // ここにボタンがをされたあとの処理をかく

                  image = new Image.asset("images/daikichi.png",
                      fit: BoxFit.fitWidth,
                      alignment: new Alignment(0.0, -0.5));
                });
              },
              child: new Text(
                "おみくじを引く",
                style: new TextStyle(color: Colors.white),
              ),
              color: Colors.pink[500],
            ),
          ),
        ),
      ], fit: StackFit.expand),
    );
  }
}