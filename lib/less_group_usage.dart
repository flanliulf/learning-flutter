import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// 演示 StatelessWidget 组件使用
class LessGroupUsage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget 常用组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget 常用组件'),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                'I am a Text',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.green,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                label: Text('I am a chip'),
                avatar: Icon(Icons.person),
              ),
              Divider(
                height: 10, // 容器高度,而非分割线的高度
                indent: 10, // 左侧间距
                color: Colors.orange,
              ),
              Card(
                // 带有圆角,阴影,边框等效果的卡片
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'I am a Card',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              AlertDialog(
                title: Text('点我'),
                content: Text('Here is content'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
