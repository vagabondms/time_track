import 'package:flutter/material.dart';

class CustomDismissibleController {
  CustomDismissibleController(TickerProvider vsync)
      : _animationController = AnimationController(vsync: vsync);

  final AnimationController _animationController;

  Animation<double> get animation => _animationController.view;

  double direction = 1;

  double get ratio => _animationController.value;
  set ratio(double ratio) {
    _animationController.value = ratio;
  }

  void moveTo() {}
}
