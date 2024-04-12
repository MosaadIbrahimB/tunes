import 'dart:async';

import 'package:flutter/material.dart';

import '../model/slawat_time_model.dart';
import '../widget/home_widget/list_view_heroz_screen_home_widget.dart';
import '../widget/home_widget/time_slawat_and_name_widget.dart';
import '../widget/home_widget/timer_now_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String nameRoute = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<SlawtTimeModel> listSlaeatTime = [
    SlawtTimeModel(name: "الفجر", time: 0430, am: "ص"),
    SlawtTimeModel(name: "الشروق", time: 0530, am: "ص"),
    SlawtTimeModel(name: "الظهر", time: 1130, am: "ص"),
    SlawtTimeModel(name: "العصر", time: 1500, am: "م"),
    SlawtTimeModel(name: "المغرب", time: 1810, am: "م"),
    SlawtTimeModel(name: "العشاء", time: 1956, am: "م"),
  ];
  String nameAzan = '';
  @override
  void initState() {
    nameAzan = listSlaeatTime[0].name;
    timeAzan();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/home.jpeg"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 77),
                //الساعة كتابة و الوقت
                const TimeNowWidget(),
                const SizedBox(height: 22),
                //المتبقى على الاذان
                Text(
                  nameAzan,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22),
                ),
                const SizedBox(width: 20),
                const SizedBox(height: 10),
                //قائمة الصلوات
                TimeSlawatAndNameWidget(),
                const SizedBox(height: 20),
                //الشاشات دعاء/سبحه/اسماء
                const Expanded(child: ListViewHerozScreenOfHomeWidget())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> timeNow() {
    int hour = DateTime.now().hour;
    int min = DateTime.now().minute;
    String stringHM = '';
    if (min < 10) {
      setState(() {
        stringHM = "${hour}0$min";
      });

    } else {
      setState(() {
        stringHM = "$hour$min";
      });

    }
    return {
      "string": stringHM,
      "int": int.parse(stringHM),
    };
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();

    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    return result;
  }


  setStateBody({int index = 0}) {
    String stringTimeList = listSlaeatTime[index].time.toString();

    if (stringTimeList.length < 4) {
      stringTimeList = "0$stringTimeList";
    }

//--- time payer
    int hList = int.parse(stringTimeList.substring(0, 2));
    int mList = int.parse(stringTimeList.substring(2));

    int timePayer = hList * 3600 + mList * 60;

//------ clock
    String stringClock = timeNow()["string"];
    if (stringClock.length < 4) {
      stringClock = "0$stringClock";
    }
    int hClock = int.parse(stringClock.substring(0, 2));
    int mClock = int.parse(stringClock.substring(2));

    int timeClock = hClock * 3600 + mClock * 60;

    //-------
    int subTimeSecond = timePayer - timeClock;
    //
    String x='';
    if(subTimeSecond>0){
       x = intToTimeLeft(subTimeSecond);
      nameAzan = "متبقى على ${listSlaeatTime[index].name} $x";
    }else{
      subTimeSecond=86400-timeClock+timePayer;
      x = intToTimeLeft(subTimeSecond);
      nameAzan = "متبقى على ${listSlaeatTime[index].name} $x";
      print( x);
//66960 >>18 h//5h

    }




    print(x);
  }

  int timeListItem(int index) {
    return listSlaeatTime[index].time;
  }

  timeAzan() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      int intHM = timeNow()["int"];

      if (timeListItem(0) > intHM) {
        setState(() {
          setStateBody(index: 0);
        });
      } else if (timeListItem(0) == intHM) {
        setState(() {
          nameAzan = "حان الان الفجر";
        });
      } else if (timeListItem(0) > intHM) {
        setState(() {
          setStateBody(index: 0);
        });
      } else if (timeListItem(1) >= intHM) {
        setState(() {
          setStateBody(index: 1);
        });
      } else if (timeListItem(2) > intHM) {
        setState(() {
          setStateBody(index: 2);
        });
      } else if (timeListItem(2) == intHM) {
        setState(() {
          nameAzan = "حان الان ${listSlaeatTime[2].name}";
        });
      } else if (timeListItem(3) > intHM) {
        setState(() {
          setStateBody(index: 3);
        });
      } else if (timeListItem(3) == intHM) {
        setState(() {
          nameAzan = "حان الان ${listSlaeatTime[3].name}";
        });
      } else if (timeListItem(4) > intHM) {
        setState(() {
          setStateBody(index: 4);
        });
      } else if (timeListItem(4) == intHM) {
        setState(() {
          nameAzan = "حان الان ${listSlaeatTime[4].name}";
        });
      } else if (timeListItem(5) > intHM) {
        setState(() {
          setStateBody(index: 5);
        });
      } else if (timeListItem(5) == intHM) {
        setState(() {
          nameAzan = "حان الان ${listSlaeatTime[5].name}";
        });
      }
      else if(timeListItem(5) < intHM){
        setStateBody(index: 0);
        // print(x);
      }
    });

    //fun
  }
}
