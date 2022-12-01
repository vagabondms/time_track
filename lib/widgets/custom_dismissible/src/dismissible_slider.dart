import 'package:flutter/material.dart';
import 'package:time_tracking/widgets/custom_dismissible/src/controller.dart';

class DismissibleSlider extends StatefulWidget {
  const DismissibleSlider({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final CustomDismissibleController controller;

  @override
  State<DismissibleSlider> createState() => _DismissibleSliderState();
}

class _DismissibleSliderState extends State<DismissibleSlider> {
  late Animation<Offset> moveAnimation;

  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 0),
    ).animate(widget.controller.animation);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
