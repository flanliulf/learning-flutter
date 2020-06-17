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
            // 左边返回按钮
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
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
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('点我'),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            ),
                            TextField(
                              // 文本输入框的样式
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintText: '请输入',
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 10),
                              decoration:
                                  BoxDecoration(color: Colors.lightBlueAccent),
                              child: PageView(
                                children: <Widget>[
                                  _item('Page1', Colors.blue),
                                  _item('Page2', Colors.yellow),
                                  _item('Page3', Colors.red),
                                  _item('Page4', Colors.green),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onRefresh: _handleRefresh)
              : Container(
                  child: Text('Here is list page'),
                )),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
