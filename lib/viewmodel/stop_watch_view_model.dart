import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchViewModel extends ChangeNotifier {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;
  final List<String> _lapTimes = [];

  int get seconds => _time ~/ 100;

  String get hundredths => '${_time % 100}'.padLeft(2, '0');

  bool get isRunning => _isRunning;

  List<String> get lapTimes => _lapTimes;

  void clickBUtton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }

    notifyListeners();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      _time++;
      notifyListeners();
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void reset() {
    _isRunning = false;
    _timer?.cancel();
    _lapTimes.clear();
    _time = 0;

    notifyListeners();
  }

  void recordLapTime() {
    _lapTimes.insert(0, '${_lapTimes.length + 1}등 $seconds.$hundredths');
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
