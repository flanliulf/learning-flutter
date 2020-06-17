import 'package:flutter/material.dart';

class GestureUsage extends StatefulWidget {
  @override
  _GestureUsageState createState() => _GestureUsageState();
}

class _GestureUsageState extends State<GestureUsage> {
  String printString = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何检测手势及处理点击事件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _printMsg('点击'),
                    onDoubleTap: () => _printMsg('双击'),
                    onLongPress: () => _printMsg('长按'),
                    onTapCancel: () => _printMsg('点击取消'),
                    onTapUp: (e) => _printMsg('松开'),
                    onTapDown: (e) => _printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        '点我',
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(printString),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printString += ' ,$msg';
    });
  }
}
