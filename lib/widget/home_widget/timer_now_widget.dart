import 'package:flutter/material.dart';

import '../../model/Timer_model.dart';

class TimeNowWidget extends StatelessWidget {
  const TimeNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Text(
          "الساعة الان",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        SizedBox(
            height: 5
        ),
        TimerWidget(),
      ],
    );
  }
}
