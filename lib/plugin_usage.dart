import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// 演示插件使用
class PluginUsage extends StatefulWidget {
  @override
  _PluginUsageState createState() => _PluginUsageState();
}

class _PluginUsageState extends State<PluginUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何使用 Flutter 包和插件'),
        // 左边返回按钮
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: ColorUtil.color('a1FF5733')),
            ),
          ],
        ),
      ),
    );
  }
}
