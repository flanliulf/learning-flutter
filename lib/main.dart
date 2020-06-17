import 'package:flutter/material.dart';
import 'package:learning_flutter/assets_usage.dart';
import 'package:learning_flutter/gesture_usage.dart';
import 'package:learning_flutter/layout_usage.dart';
import 'package:learning_flutter/stateful_group_usage.dart';
import 'package:learning_flutter/stateless_group_usage.dart';
import 'package:learning_flutter/plugin_usage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建及使用 Flutter 路由和导航'),
        ),
        body: RouterNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        // 注册路由
        'stateless': (BuildContext context) => StatelessGroupUsage(),
        'stateful': (BuildContext context) => StatefulGroupUsage(),
        'layout': (BuildContext context) => LayoutUsage(),
        'plugin': (BuildContext context) => PluginUsage(),
        'gesture': (BuildContext context) => GestureUsage(),
        'assets': (BuildContext context) => AssetsUsage(),
      },
    );
  }
}

class RouterNavigator extends StatefulWidget {
  @override
  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由名跳转'),
              value: false,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('如何使用 Flutter 包和插件', PluginUsage(), 'plugin'),
          _item('StatelessWidget 常用组件', StatelessGroupUsage(), 'stateless'),
          _item('StatefulWidget 常用组件', StatefulGroupUsage(), 'stateful'),
          _item('如何进行 Flutter 布局开发', LayoutUsage(), 'layout'),
          _item('如何检测手势及处理点击事件', GestureUsage(), 'gesture'),
          _item('如何导入和使用 Flutter 的资源文件', AssetsUsage(), 'assets'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            // 通过路由名跳转
            Navigator.pushNamed(context, routeName);
          } else {
            // 通过页面导航
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
