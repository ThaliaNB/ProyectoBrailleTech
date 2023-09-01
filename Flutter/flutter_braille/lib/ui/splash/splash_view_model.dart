import 'package:flutter/cupertino.dart';

class SplashViewModel with ChangeNotifier {
  SplashViewModel();

  late bool _changeScreen;

  bool get changeScreen => _changeScreen;

  void init() async {
    _changeScreen = false;
    Future.delayed(const Duration(seconds: 3), () {
      _changeScreen = true;
      notifyListeners();
    });
  }
}
