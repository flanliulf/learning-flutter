import 'package:flutter/material.dart';

/// Flutter 页面生命周期
/// StatefulWidget 生命周期方法:
/// 1. 初始化时期:
///  createState  initState
/// 2. 更新时期
/// didChangeDependencies build didUpdateWidget
/// 3. 销毁时期
/// deactivate dispose
///
class WidgetLifecycle extends StatefulWidget {
  /// 当新创建一个 StatefulWidget 时,会立即调用 createState, 并且该方法是必须覆盖的
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  /// initState 是创建 Widget 时调用的第一个方法
  /// 类似于 Android 的 onCreate 和 iOS 的 viewDidLoad
  /// 该方法主要负责一些只需要发生一次的初始化工作,比如 channel 和监听器等
  @override
  void initState() {
    print('---initState---');
    super.initState();
  }

  /// 该方法在 State 对象发生变化时调用:
  /// 1. 在第一次构建 widget 时,在 initState 之后立即调用此方法
  /// 2. 如果 StatefulWidget 依赖于 InheritedWidget ,那么当前 State 所依赖的 InheritedWidget 中的变量发生改变时,会再次调用
  @override
  void didChangeDependencies() {
    print('---didChangeDependencies---');
    super.didChangeDependencies();
  }

  /// 该方法必须被实现,主要用来实现需要呈现的页面内容
  /// 该方法会在 didChangeDependencies 方法之后立即执行
  /// 另外在 setState 方法调用后,也会再次执行
  @override
  Widget build(BuildContext context) {
    print('---build---');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 页面生命周期'),
        // 左边返回按钮
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString()),
          ],
        ),
      ),
    );
  }

  /// 该方法并不常用,只有当父组件需要重新绘制时才会调用
  /// 该方法会接受一个 oldWidget 参数,可以将该参数与当前的 widget 对象进行对比,来执行以下额外的逻辑,比如
  /// if(oldWidget.xxx != widget.xxx)
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print('---didUpdateWidget---');
    super.didUpdateWidget(oldWidget);
  }

  /// 该方法很少使用,在组件被移除时 dispose 调用之前执行
  @override
  void deactivate() {
    print('---deactivate---');
    super.deactivate();
  }

  /// 常用方法,在组件被销毁时执行
  /// 通常在该方法中处理一些资源的释放工作,比如监听器的卸载,channel 的销毁等
  @override
  void dispose() {
    print('---dispose---');
    super.dispose();
  }
}
