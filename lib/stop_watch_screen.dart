import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  Timer? _timer;

  int _time = 0;
  bool _isRunning = false;

  List<String> _lapTimes = [];

  void _clickBUtton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _lapTimes.clear();
    _time = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    int sec = _time ~/ 100;
    String hundredth = '${_time % 100}'.padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$sec', style: const TextStyle(fontSize: 50)),
              Text(hundredth),
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: ListView(
              children: const [
                Center(child: Text('111')),
                Text('111'),
                Text('111'),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {
                  setState(() {
                    _reset();
                  });
                },
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _clickBUtton();
                  });
                },
                child: _isRunning
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {},
                child: const Icon(Icons.add),
              )
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}