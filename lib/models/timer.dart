import 'dart:async';

import 'package:flutter/foundation.dart';

class TimeTracker extends ChangeNotifier {
  Timer? _timer;
  int _currentSeconds = 0;
  int _targetSeconds = 0;

  bool get isActive => _timer?.isActive ?? false;

  int get hours => (_targetSeconds - _currentSeconds) ~/ 3600;
  int get minutes => (_targetSeconds - _currentSeconds) ~/ 60;
  int get seconds => (_targetSeconds - _currentSeconds) % 60;

  String get formatMMSS => '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

  void start(int seconds) {
    const oneSec = Duration(seconds: 1);
    _currentSeconds = 0;
    _targetSeconds = seconds;
    _timer = Timer.periodic(oneSec, (timer) {
      _currentSeconds++;
      notifyListeners();
      if (_currentSeconds == _targetSeconds) {
        timer.cancel();
      }
    });
  }

  void stop() {
    _timer?.cancel();
    notifyListeners();
  }
}