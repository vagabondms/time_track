import 'package:flutter/material.dart';

const Duration _defaultDuration = Duration(milliseconds: 300);

enum Direction {
  left,
  none,
  right,
}

enum ActionPaneType {
  start,
  end,
}

class CustomDismissibleController {
  CustomDismissibleController(TickerProvider vsync)
      : _animationController =
            AnimationController(vsync: vsync, duration: _defaultDuration);

  final AnimationController _animationController;

  Animation<double> get animation => _animationController.view;

  double get ratio => _animationController.value;
  set ratio(double ratio) {
    _animationController.value = ratio;
  }

  ValueNotifier<double> direction = ValueNotifier(0);
  void updateDirection(double direction) {
    if (direction != this.direction.value) {
      this.direction.value = direction;
      switch (direction.toInt()) {
        case -1:
          _actionPaneType.value = ActionPaneType.end;
          break;
        case 1:
          _actionPaneType.value = ActionPaneType.start;
          break;
        default:
          _actionPaneType.value = ActionPaneType.start;
      }
    }
  }

  final ValueNotifier<ActionPaneType> _actionPaneType =
      ValueNotifier(ActionPaneType.start);
  ValueNotifier<ActionPaneType> get actionPaneType => _actionPaneType;

  void openStartActionPane() {}

  void closeStartActionPane() {}

  void openEndActionPane() {}

  void closeEndActionPane() {}

  void close() async {
    await _animationController.reverse();
    direction.value = 0;
    ratio = 0;
  }
}
