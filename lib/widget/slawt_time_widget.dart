import 'package:flutter/material.dart';

import '../model/slawat_time_model.dart';

class SalwatTimeWidget extends StatelessWidget {
  SlawtTimeModel slawtTimeModel;
  SalwatTimeWidget({super.key,required this.slawtTimeModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(children: [
        Expanded(
          child: Text(
            slawtTimeModel.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        Text(
          slawtTimeModel.time,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          slawtTimeModel.am,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        const SizedBox(width: 10),
      ],),
    );
  }
}
