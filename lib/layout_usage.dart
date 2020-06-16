import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// 演示 StatefulWidget 组件使用
class LayoutUsage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LayoutUsageState();
}

class _LayoutUsageState extends State<LayoutUsage> {
  // 底部导航栏索引
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何进行 Flutter 布局开发',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行 Flutter 布局开发'),
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
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                    'http://www.devio.org/img/avatar.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  // 剪裁成圆角
                                  borderRadius: BorderRadius.all(
                                      // 四角都裁
                                      Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.6, // 60%透明度
                                    child: Image.network(
                                      'http://www.devio.org/img/avatar.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            // 文本输入框的样式
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                hintText: '请输入',
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                          Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                // 圆角剪裁
                                borderRadius: BorderRadius.circular(20),
                                // 抗锯齿
                                clipBehavior: Clip.antiAlias,
                                child: PageView(
                                  children: <Widget>[
                                    _item('Page1', Colors.blue),
                                    _item('Page2', Colors.yellow),
                                    _item('Page3', Colors.red),
                                    _item('Page4', Colors.green),
                                  ],
                                ),
                              )),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                // 宽度撑满比例
                                widthFactor: 1,
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.greenAccent),
                                  child: Text('这里是撑满的文字'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Stack(
                      children: <Widget>[
                        Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      // 创建 Wrap 布局,从左到右进行排列,会自动换行
                      spacing: 8, // 水平间距
                      runSpacing: 6, // 垂直间距
                      children: <Widget>[
                        _chip('Flutter'),
                        _chip('In'),
                        _chip('Action'),
                        _chip('实战'),
                        _chip('进阶指南'),
                        _chip('案例分析'),
                      ],
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Column(
                children: <Widget>[
                  Text('这里是列表'),
                  Expanded(
                    // 利用 Expanded 拉伸填满高度
                    child: Container(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text('这里的文字拉伸撑满高度'),
                    ),
                  )
                ],
              ),
      ),
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

  _chip(String title) {
    return Chip(
      label: Text(title),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          title.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
