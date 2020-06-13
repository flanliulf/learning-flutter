import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// 演示 StatefulWidget 组件使用
class StatefulGroupUsage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatefulGroupUsageState();
}

class _StatefulGroupUsageState extends State<StatefulGroupUsage> {
  // 底部导航栏索引
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget 常用组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('StatefulWidget 常用组件'),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  title: Text('首页'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  title: Text('列表'),
                ),
              ]),
          body: _currentIndex == 0
              ? Container(
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
                )
              : Container(
                  child: Text('Here is list page'),
                )),
    );
  }
}
