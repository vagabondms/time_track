import 'package:flutter/material.dart';

import 'action.dart';

class ActionPaneConfig {
  ActionPaneConfig({
    required this.alignment,
  });

  final Alignment alignment;
}

class ActionPaneConfiguration extends InheritedWidget {
  const ActionPaneConfiguration({
    Key? key,
    required Widget child,
    required this.configure,
  }) : super(key: key, child: child);

  final ActionPaneConfig configure;

  static ActionPaneConfig of(BuildContext context) {
    final ActionPaneConfiguration? result =
        context.dependOnInheritedWidgetOfExactType<ActionPaneConfiguration>();
    assert(result != null, 'No ActionPaneConfiguration found in context');
    return result!.configure;
  }

  @override
  bool updateShouldNotify(ActionPaneConfiguration oldWidget) {
    return configure != oldWidget.configure;
  }
}

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
    this.extentRatio = 0.5,
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
      heightFactor: null,
      child: Flex(
        direction: Axis.horizontal,
        children: widget.children,
      ),
    );
  }
}
