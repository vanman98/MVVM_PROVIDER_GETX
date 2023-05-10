import 'package:flutter/cupertino.dart';

class WidgetFadeTransitions extends StatefulWidget {
  final Widget child;
  final int duration;
  WidgetFadeTransitions({required this.child,required  this.duration});
  @override
  _WidgetFadeTransitionsState createState() => _WidgetFadeTransitionsState();
}

class _WidgetFadeTransitionsState extends State<WidgetFadeTransitions> with TickerProviderStateMixin{
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: Duration(milliseconds: widget.duration), vsync: this);
    animation = new CurvedAnimation(parent: controller!, curve: Curves.ease);
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.reverse();
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation!,
      child: widget.child,
    );
  }
}
