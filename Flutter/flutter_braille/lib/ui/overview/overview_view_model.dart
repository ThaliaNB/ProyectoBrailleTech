import 'package:flutter/cupertino.dart';

class OverviewViewModel with ChangeNotifier {
  OverviewViewModel();

  late bool _changeScreen;

  bool get changeScreen => _changeScreen;

  void init() async {
    _changeScreen = false;
    Future.delayed(Duration(seconds: 2), () {
      _changeScreen = true;
      notifyListeners();
    });
  }
}
