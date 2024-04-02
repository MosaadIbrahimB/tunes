import 'package:flutter/material.dart';
import 'package:tunes/widget/home_widget/slawt_time_widget.dart';

import '../../model/slawat_time_model.dart';


class TimeSlawatAndNameWidget extends StatelessWidget {
  List<SlawtTimeModel> listSlaeatTime = [
    SlawtTimeModel(name: "الفجر", time: "04.30", am: "ص"),
    SlawtTimeModel(name: "الشروق", time: "05.30", am: "ص"),
    SlawtTimeModel(name: "الظهر", time: "11.30", am: "ص"),
    SlawtTimeModel(name: "العصر", time: "03.30", am: "م"),
    SlawtTimeModel(name: "المغرب", time: "06.16", am: "م"),
    SlawtTimeModel(name: "العشاء", time: "07.33", am: "م"),
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
