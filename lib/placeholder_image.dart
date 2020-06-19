import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:transparent_image/transparent_image.dart';

/// 演示 图片Placeholder
class PlaceholderImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlaceholderImageState();
}

class _PlaceholderImageState extends State<PlaceholderImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何设置图片 Placeholder'),
        // 左边返回按钮
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          Center(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'http://www.devio.org/img/avatar.png'),
          ),
        ],
      )
    );
  }
}
