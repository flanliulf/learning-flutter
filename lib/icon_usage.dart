//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 如何加载Icon图标
class IconUsage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IconUsageState();
}

class _IconUsageState extends State<IconUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何加载Icon图标'),
        // 左边返回按钮
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Icon(
          Icons.android,
          size: 100,
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}
