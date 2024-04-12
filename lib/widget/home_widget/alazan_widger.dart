// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../model/slawat_time_model.dart';
// import '../../provider/timer_provider.dart';
// import '../../shared/payer_list_shared.dart';
//
// class Alazan extends StatefulWidget {
//   @override
//   State<Alazan> createState() => _AlazanState();
// }
//
// class _AlazanState extends State<Alazan> {
//   // List<SlawtTimeModel> listSlaeatTime = PayerTime.listSlaeatTime;
// @override
//   void initState() {
//
//   super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//
//     return const Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           (0 == 0 && 0 == 0)
//               ? "الان صلاة "
//               : "متبقى على ""}",
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontSize: 22),
//         ),
//         SizedBox(width: 20),
//         (0 == 0 && 0 == 0)? SizedBox(width: 20):
//         Text(
//           "{provider.subTimeMinute.toString()} : {provider.subTimeHour.toString()}  ",
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         )
//       ],
//     );
//   }
//
//
//
// }
