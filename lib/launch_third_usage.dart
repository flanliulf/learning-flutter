import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 如何在 Flutter 中打开第三方应用
class LaunchThirdUsage extends StatefulWidget {
  @override
  _LaunchThirdUsageState createState() => _LaunchThirdUsageState();
}

class _LaunchThirdUsageState extends State<LaunchThirdUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何在 Flutter 中打开第三方应用'),
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
            RaisedButton(
              onPressed: () => _launchURL(),
              child: Text('打开浏览器'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
