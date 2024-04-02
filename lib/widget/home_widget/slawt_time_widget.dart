import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/slawat_time_model.dart';

class SalwatTimeWidget extends StatelessWidget {
  SlawtTimeModel slawtTimeModel;
  SalwatTimeWidget({super.key,required this.slawtTimeModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(children: [
        Expanded(
          child: Text(
            slawtTimeModel.name,
            style: textStyle(),
          ),
        ),
        Text(
          slawtTimeModel.time,
          style: textStyle(),
        ),
        Container(alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(left: 10,right: 23),
          width: 15,
          child: Text(
            slawtTimeModel.am,
            style:  textStyle()
          ),
        ),
      ],),
    );
  }

  textStyle(){
    return const TextStyle(
      color: Colors.white,

      fontSize: 24,
    );
  }
}
