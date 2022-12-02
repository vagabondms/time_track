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
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller.direction,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(widget.controller.direction.value, 0),
          ).animate(widget.controller.animation),
          child: widget.child,
        );
      },
    );
  }
}
