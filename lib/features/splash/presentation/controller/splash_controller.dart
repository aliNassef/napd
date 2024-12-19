import 'dart:async';
import 'package:flutter/foundation.dart';

class SplashController {
  void startSplash(VoidCallback onComplete) {
    Timer(const Duration(seconds: 4), onComplete);
  }
}
