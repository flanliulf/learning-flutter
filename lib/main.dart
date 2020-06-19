import 'package:flutter/material.dart';
import 'package:learning_flutter/app_lifecycle.dart';
import 'package:learning_flutter/assets_usage.dart';
import 'package:learning_flutter/cached_network_image.dart';
import 'package:learning_flutter/gesture_usage.dart';
import 'package:learning_flutter/launch_third_usage.dart';
import 'package:learning_flutter/layout_usage.dart';
import 'package:learning_flutter/photo_app.dart';
import 'package:learning_flutter/placeholder_image.dart';
import 'package:learning_flutter/stateful_group_usage.dart';
import 'package:learning_flutter/stateless_group_usage.dart';
import 'package:learning_flutter/plugin_usage.dart';
import 'package:learning_flutter/widget_lifecycle.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 设置页面全局字体
//        fontFamily: "Roboto-BlackItalic",
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何创建及使用 Flutter 路由和导航'),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (_brightness == Brightness.light) {
                      _brightness = Brightness.dark;
                    } else {
                      _brightness = Brightness.light;
                    }
                  });
                },
                child: Text(
                  '切换主题abc',
                  style: TextStyle(
                    // 局部组件应用字体
                    fontFamily: "Roboto-BlackItalic",
                  ),
                ),
              ),
              RouterNavigator(),
            ],
          )),
      routes: <String, WidgetBuilder>{
        // 注册路由
        'stateless': (BuildContext context) => StatelessGroupUsage(),
        'stateful': (BuildContext context) => StatefulGroupUsage(),
        'layout': (BuildContext context) => LayoutUsage(),
        'plugin': (BuildContext context) => PluginUsage(),
        'gesture': (BuildContext context) => GestureUsage(),
        'assets': (BuildContext context) => AssetsUsage(),
        'launch': (BuildContext context) => LaunchThirdUsage(),
        'lifecycle': (BuildContext context) => WidgetLifecycle(),
        'applifecycle': (BuildContext context) => AppLifecycle(),
        'photoapp': (BuildContext context) => PhotoApp(),
        'imageplaceholder': (BuildContext context) => PlaceholderImage(),
        'cachedimage': (BuildContext context) => CachedNetworkImageUsage(),
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
          _item('如何在 Flutter 中打开第三方应用', LaunchThirdUsage(), 'launch'),
          _item('Flutter 页面的生命周期', WidgetLifecycle(), 'lifecycle'),
          _item('Flutter 应用的生命周期', AppLifecycle(), 'applifecycle'),
          _item('简单案例之拍照 App', PhotoApp(), 'photoapp'),
          _item('如何设置图片 Placeholder', PlaceholderImage(), 'imageplaceholder'),
          _item('如何使用网络图片缓存', CachedNetworkImageUsage(), 'cachedimage'),
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
