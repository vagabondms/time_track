import 'package:flutter/material.dart';
import 'package:time_tracking/widgets/custom_dismissible/src/controller.dart';

class DismissibleGestureDetector extends StatefulWidget {
  const DismissibleGestureDetector({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  final Widget? child;

  final CustomDismissibleController controller;

  @override
  State<DismissibleGestureDetector> createState() =>
      _DismissibleGestureDetectorState();
}

class _DismissibleGestureDetectorState
    extends State<DismissibleGestureDetector> {
  double dragExtent = 0;

  double get overallDragAxisExtent {
    final Size? size = context.size;
    return size!.width;
  }

  void _handleDragStart(DragStartDetails details) {}

  void _handleDragUpdate(DragUpdateDetails details) {
    dragExtent += details.primaryDelta!;
    widget.controller.updateDirection(dragExtent.sign);
    widget.controller.ratio = dragExtent.abs() / overallDragAxisExtent;
  }

  void _handleDragEnd(DragEndDetails details) {
    widget.controller.close();
    dragExtent = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: widget.child,
    );
  }
}
