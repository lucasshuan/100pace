import 'dart:async';

import 'package:flutter/foundation.dart';

@immutable
class Record {
  final Duration duration;
  final Duration targetDuration;
  final DateTime createdAt = DateTime.now();

  bool get isCompleted => duration >= targetDuration;

  Record(seconds, targetSeconds) :
    duration = Duration(seconds: seconds),
    targetDuration = Duration(seconds: targetSeconds);
}

class Tracker extends ChangeNotifier {
  List<Record> records = [];

  Timer? _timer;

  int _currentSeconds = 0;
  int _targetSeconds = 0;

  bool get isRunning => _timer?.isActive ?? false;
  bool get isFinished => _currentSeconds >= _targetSeconds;

  int get hours => _currentSeconds ~/ 3600;
  int get minutes => _currentSeconds ~/ 60;
  int get seconds => _currentSeconds % 60;

  String get formatMMSS => '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

  void start(int targetSeconds) {
    const oneSec = Duration(seconds: 1);
    _currentSeconds = 0;
    _targetSeconds = targetSeconds;
    notifyListeners();
    _timer = Timer.periodic(oneSec, (timer) {
      _currentSeconds++;
      notifyListeners();
      if (isFinished) {
        stop();
      }
    });
  }

  void stop() {
    var record = Record(_currentSeconds, _targetSeconds);
    records.add(record);
    _timer?.cancel();
    _currentSeconds = 0;
    notifyListeners();
  }
}