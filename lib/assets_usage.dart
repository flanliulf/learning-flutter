import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// 如何导入和使用 Flutter 的资源文件
class AssetsUsage extends StatefulWidget {
  @override
  _AssetsUsageState createState() => _AssetsUsageState();
}

class _AssetsUsageState extends State<AssetsUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何导入和使用 Flutter 的资源文件'),
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
            Image(
              height: 100,
              width: 100,
              image: AssetImage('images/avatar.png'),
            ),
          ],
        ),
      ),
    );
  }
}
