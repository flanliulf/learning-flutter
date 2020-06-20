import 'package:flutter/material.dart';

/// 使用 AnimatedWidget 重构动画
class AnimatedWidgetUsage extends StatefulWidget {
  @override
  _AnimatedWidgetUsageState createState() => _AnimatedWidgetUsageState();
}

/// 使用 AnimatedWidget 后,不需要手动调用动画的 addListener 并在回调中添加 setState 才能看到效果,
/// AnimatedWidget 会自动在 build 时使用动画的当前值
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class _AnimatedWidgetUsageState extends State<AnimatedWidgetUsage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      // 动画执行时间为 2 秒
        duration: const Duration(seconds: 2),
        vsync: this);
    // 如果需要知道动画执行的进度和状态,可以通过 animation 的监听器方法来给动画添加监听
    animation = Tween<double>(begin: 0, end: 300).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用 AnimatedWidget 重构动画'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AnimatedLogo(animation: animation),
    );
  }

  @override
  void dispose() {
    // 需要及时回收销毁资源
    animationController.dispose();
    super.dispose();
  }
}
