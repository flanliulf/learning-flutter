import 'package:flutter/material.dart';

/// 使用 AnimatedBuilder 将动画和 widget 进行分离
class AnimatedWidgetUsage extends StatefulWidget {
  @override
  _AnimatedWidgetUsageState createState() => _AnimatedWidgetUsageState();
}

/// 负责显示的 Widget
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

/// 负责动画的 Widget
class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({Key key, this.child, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
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
      body: Center(
        child: GrowTransition(
          animation: animation,
          child: LogoWidget(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 需要及时回收销毁资源
    animationController.dispose();
    super.dispose();
  }
}
