import 'package:flutter/material.dart';

/// 如何给 Widget 添加动画
class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        // 动画执行时间为 2 秒
        duration: const Duration(seconds: 2),
        vsync: this);
    // 如果需要知道动画执行的进度和状态,可以通过 animation 的监听器方法来给动画添加监听
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addListener(() {
        // 当动画的值发生变化时被调用
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((status) {
        // 当动画的状态发生变化时被调用
        setState(() {
          animationStatus = animation.status;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何给 Widget 添加动画'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // 动画开始前,先重置初始值
                animationController.reset();
                animationController.forward();
              },
              child: Text(
                '开始',
                textDirection: TextDirection.ltr,
              ),
            ),
            Text(
              'State:' + animationStatus.toString(),
              textDirection: TextDirection.ltr,
            ),
            Text(
              'Value:' + animationValue.toString(),
              textDirection: TextDirection.ltr,
            ),
            Container(
              height: animation.value,
              width: animation.value,
              child: FlutterLogo(),
            ),
          ],
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
