import 'package:flutter/material.dart';
import 'package:time_tracking/widgets/custom_dismissible/src/dismissible_slider.dart';

import 'action_pane.dart';
import 'controller.dart';
import 'dismissible_gesture_detector.dart';

class CustomDismissible extends StatefulWidget {
  final Widget child;
  final ActionPane? startPane;
  final ActionPane? endPane;

  const CustomDismissible({
    Key? key,
    required this.child,
    this.startPane,
    this.endPane,
  }) : super(key: key);

  @override
  State<CustomDismissible> createState() => _CustomDismissibleState();
}

class _CustomDismissibleState extends State<CustomDismissible>
    with SingleTickerProviderStateMixin {
  late final CustomDismissibleController _controller;
  late Animation<Offset> moveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = CustomDismissibleController(this);
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleGestureDetector(
      controller: _controller,
      child: ClipRect(
        child: Stack(
          children: [
            DismissibleSlider(
              controller: _controller,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
