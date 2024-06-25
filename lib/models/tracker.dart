import 'dart:async';

import 'package:flutter/foundation.dart';

@immutable
class Track {
  final Duration duration;
  final Duration targetDuration;
  final DateTime createdAt = DateTime.now();

  bool get isCompleted => duration >= targetDuration;

  Track(this.duration, this.targetDuration);
}

class Tracker extends ChangeNotifier {
  List<Track> tracks = [];

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
    var track = Track(
        Duration(seconds: _currentSeconds),
        Duration(seconds: _targetSeconds),
    );
    tracks.add(track);
    _timer?.cancel();
    _currentSeconds = 0;
    notifyListeners();
  }
}