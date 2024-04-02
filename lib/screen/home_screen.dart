import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunes/shared/dowa_provider_model.dart';

import '../widget/home_widget/list_view_heroz_screen_home_widget.dart';
import '../widget/home_widget/timer_now_widget.dart';
import '../widget/home_widget/time_slawat_and_name_widget.dart';


class HomeScreen extends StatelessWidget {
  static const String nameRoute = "HomeScreen";

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/home.jpeg"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 77
                ),
                //الساعة كتابة و الوقت
                const TimeNowWidget(),
                const SizedBox(
                  height: 8
                ),
                //قائمة الصلوات
                TimeSlawatAndNameWidget(),
                const SizedBox(
                    height: 20
                ),
                //الشاشات دعاء/سبحه/اسماء
                const Expanded(
                  child: ListViewHerozScreenOfHomeWidget()
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}









