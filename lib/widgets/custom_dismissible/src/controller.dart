import 'package:flutter/material.dart';

import 'action_pane.dart';

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

  bool _startPaneActivated = false;
  double _startPaneExtendRatio = 0;
  void activateStartPane(ActionPane? actionPane) {
    if (actionPane != null) {
      _startPaneActivated = true;
      _startPaneExtendRatio = actionPane.extentRatio;
    }
  }

  bool _endPaneActivated = false;
  double _endPaneExtendRatio = 0;
  void activateEndPane(ActionPane? actionPane) {
    if (actionPane != null) {
      _endPaneActivated = true;
      _endPaneExtendRatio = actionPane.extentRatio;
    }
  }

  ValueNotifier<double> direction = ValueNotifier(0);
  void updateDirection(double direction) {
    if (direction != this.direction.value) {
      final int sign = direction.toInt();

      if (sign == -1 && _endPaneActivated) {
        this.direction.value = direction;
        _actionPaneType.value = ActionPaneType.end;
        return;
      }

      if (sign == 1 && _startPaneActivated) {
        this.direction.value = direction;
        _actionPaneType.value = ActionPaneType.start;
        return;
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
