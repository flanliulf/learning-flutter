import 'package:flutter/material.dart';

/// Flutter 应用的生命周期
///  WidgetBindingObserver 是 Widgets 的绑定观察器,通过它可以监听应用的生命周期,语言的变化等
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 应用的生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter 应用的生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if (state == AppLifecycleState.paused) {
      print('App 进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('App 进入前台');
    } else if (state == AppLifecycleState.inactive) {
      // 应用程序处于非活动状态,并且未接收用户输入时执行,典型场景就是电话打进来了
      print('App 进入非活动状态');
    } else if (state == AppLifecycleState.detached) {
      print('App 进入前台');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
