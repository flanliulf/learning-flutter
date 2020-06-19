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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(MyIcons.iosDark, size: 64,),
            Icon(MyIcons.iosLight, size: 64,),
            Icon(MyIcons.iosText, size: 64,),
          ],
        )
      ),
    );
  }
}

class MyIcons{
  // iOS 黑色 图标
  static const IconData iosDark = const IconData(
      0xe676,
      fontFamily: 'iosIcon',
      matchTextDirection: true
  );
  // ios 浅色图标
  static const IconData iosLight = const IconData(
      0xe62a,
      fontFamily: 'iosIcon',
      matchTextDirection: true
  );
  // ios 文字图标
  static const IconData iosText = const IconData(
      0xe734,
      fontFamily: 'iosIcon',
      matchTextDirection: true
  );
}
