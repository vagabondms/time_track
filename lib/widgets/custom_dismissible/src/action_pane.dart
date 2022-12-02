import 'package:flutter/material.dart';

import 'action.dart';
import 'dismissible.dart';

enum PaneAlignment {
  left,
  right,
}

class ActionPane extends StatefulWidget {
  final List<ActionPaneItem> children;
  final double extentRatio;

  const ActionPane({
    Key? key,
    required this.children,
    this.extentRatio = 0.3,
  }) : super(key: key);

  @override
  State<ActionPane> createState() => _ActionPaneState();
}

class _ActionPaneState extends State<ActionPane> {
  @override
  Widget build(BuildContext context) {
    final actionPaneConfig = ActionPaneConfiguration.of(context);

    final factor = widget.extentRatio;
    return FractionallySizedBox(
      alignment: actionPaneConfig.alignment,
      widthFactor: factor,
      child: Flex(
        direction: Axis.horizontal,
        children: widget.children,
      ),
    );
  }
}
