import 'package:flutter/material.dart';
import 'package:tunes/widget/home_widget/slawt_time_widget.dart';

import '../../model/slawat_time_model.dart';
import '../../shared/payer_list_shared.dart';


class TimeSlawatAndNameWidget extends StatelessWidget {
  static List<SlawtTimeModel> listSlaeatTime = [
    SlawtTimeModel(name: "الفجر", time: 0430, am: "ص"),
    SlawtTimeModel(name: "الشروق", time:0530, am: "ص"),
    SlawtTimeModel(name: "الظهر", time: 1130, am: "ص"),
    SlawtTimeModel(name: "العصر", time: 1500, am: "م"),
    SlawtTimeModel(name: "المغرب", time: 1810, am: "م"),
    SlawtTimeModel(name: "العشاء", time: 1956, am: "م"),
  ];
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: const Color(0xff9c682d).withOpacity(.8),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: List.generate(
            listSlaeatTime.length,
                (index) => SalwatTimeWidget(
              slawtTimeModel: listSlaeatTime[index],
            )),
      ),
    );
  }
}
