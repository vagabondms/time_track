import 'package:flutter/material.dart';
import 'package:time_tracking/widgets/custom_dismissible/custom_dismissible.dart';
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
    _controller = CustomDismissibleController(this)
      ..activateStartPane(startPane)
      ..activateEndPane(endPane);
  }

  ActionPane? get startPane => widget.startPane;
  ActionPane? get endPane => widget.endPane;
  ActionPane? get actionPane {
    switch (_controller.actionPaneType.value) {
      case ActionPaneType.start:
        return startPane;
      case ActionPaneType.end:
        return endPane;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleGestureDetector(
      controller: _controller,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _controller.actionPaneType,
          builder: (context, Widget? child) {
            return Stack(
              children: [
                //ActionPaneConfig
                AnimatedBuilder(
                    animation: _controller.direction,
                    builder: (context, child) {
                      final sign = _controller.direction.value.toDouble();
                      final actionPaneAlignment = Alignment(-sign, 0);

                      return ActionPaneConfiguration(
                        configure: ActionPaneConfig(
                          alignment: actionPaneAlignment,
                        ),
                        child: Positioned.fill(
                          child: FractionallySizedBox(
                            alignment: actionPaneAlignment,
                            child: actionPane,
                          ),
                        ),
                      );
                    }),
                DismissibleSlider(
                  controller: _controller,
                  child: widget.child,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
