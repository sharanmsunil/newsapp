import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  bool _isSplashFinished = false;

  bool get isSplashFinished => _isSplashFinished;

  void finishSplash() {
    _isSplashFinished = true;
    notifyListeners();
  }
}
