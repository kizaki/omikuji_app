import 'dart:math' as math;

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
  String imageName = "images/top.png";
  var random = new math.Random();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: new Stack(children: <Widget>[
        new Image.asset(
          "$imageName",
          //fit: BoxFit.fitHeight, // 縦幅を画面に合わせる
          alignment: new Alignment(0.0, -0.5),
        ),
        new Align(
          alignment: new Alignment(0.0, 0.8),
          child: Container(
            margin: new EdgeInsets.only(bottom: 0.0),
            child: new RaisedButton(
              onPressed: () {
                setState(() {
                  int kazu = random.nextInt(7);
                  print(kazu);
                    switch (kazu){
                      case 0:
                        imageName = "images/daikichi.png";
                        break;
                      case 1:
                        imageName = "images/chuukichi.png";
                        break;
                      case 2:
                        imageName = "images/daikyou.png";
                        break;
                      case 3:
                        imageName = "images/kichi.png";
                        break;
                      case 4:
                        imageName = "images/kyou.png";
                        break;
                      case 5:
                        imageName = "images/suekichi.png";
                        break;
                      case 6:
                        imageName = "images/syoukichi.png";
                        break;
                    }
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
