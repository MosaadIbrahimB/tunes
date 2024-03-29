import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_currentTime.hour.toString().padLeft(2, '0')}:'
          '${_currentTime.minute.toString().padLeft(2, '0')}:'
          '${_currentTime.second.toString().padLeft(2, '0')}',
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: Colors.white),
    );
  }
}