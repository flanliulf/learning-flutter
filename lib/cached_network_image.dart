//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 演示网络图片本地缓存
class CachedNetworkImageUsage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CachedNetworkImageUsageState();
}

class _CachedNetworkImageUsageState extends State<CachedNetworkImageUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何使用网络图片缓存'),
        // 左边返回按钮
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
//        child: CachedNetworkImage(
//            placeholder: (context, url) => new CircularProgressIndicator(),
//            imageUrl: 'http://picsum.photos/250?image=9'),
      ),
    );
  }
}
