import 'package:flutter/material.dart';

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
