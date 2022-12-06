import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeConfig.light;
  ThemeData get theme => _theme;
  set theme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}
