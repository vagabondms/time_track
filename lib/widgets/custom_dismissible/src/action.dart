import 'package:flutter/material.dart';

const _defaultFlex = 1;

class ActionPaneItem extends StatelessWidget {
  const ActionPaneItem({
    Key? key,
    required this.child,
    this.color,
    this.onTap,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: _defaultFlex,
      child: SizedBox.expand(
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            padding: padding,
            backgroundColor: color,
            shape: const BeveledRectangleBorder(),
            side: BorderSide.none,
          ),
          child: child,
        ),
      ),
    );
  }
}
