import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late DateTime _currentTime;
  String formattedDate = '';
  String clock = '';
  String date = '';
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
        formattedDate =
            DateFormat().add_yMMMEd().add_jms().format(_currentTime);
        clock = formattedDate.substring(16);
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
      clock,
      style: const TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
