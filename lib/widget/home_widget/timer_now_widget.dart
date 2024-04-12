import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeNowWidget extends StatefulWidget {
  const TimeNowWidget({super.key});

  @override
  State<TimeNowWidget> createState() => _TimeNowWidgetState();
}

class _TimeNowWidgetState extends State<TimeNowWidget> {
  late Timer timer;
  var clock =
      DateFormat().add_yMMMEd().add_jms().format(DateTime.now()).substring(17);
  @override
  initState() {
    super.initState();
    timerFunction();
  }

  timerFunction() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      clock = DateFormat()
          .add_yMMMEd()
          .add_jms()
          .format(DateTime.now())
          .substring(17);
      setState(() {

      });
    });

  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var provider=Provider.of<TimerProvider>(context);
    // provider.timePayer();
    return Column(
      children: [
        const Text(
          "الساعة الان",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          clock,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}
