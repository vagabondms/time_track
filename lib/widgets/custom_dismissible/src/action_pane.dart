import 'package:flutter/material.dart';

class ActionPane extends StatelessWidget {
  final List<ActionPaneItem> children;

  const ActionPane({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
    );
  }
}

class ActionPaneItem extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ActionPaneItem({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.grey,
      child: child,
    );
  }
}
