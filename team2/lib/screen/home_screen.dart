import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tunes/screen/tasepahScreen.dart';
import '../model/Timer_model.dart';
import '../model/slawat_time_model.dart';
import '../widget/item_widget.dart';
import '../model/sound_data.dart';
import '../widget/slawt_time_widget.dart';
import 'asma_allah_screen.dart';
import 'auraen_sound_screen.dart';
import 'nivgater_list_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String nameRoute = "HomeScreen";
  List<SlawtTimeModel> listSlaeatTime = [
    SlawtTimeModel(name: "Fager", time: "4.30", am: "Am"),
    SlawtTimeModel(name: "Sunraise", time: "5.30", am: "Am"),
    SlawtTimeModel(name: "Dhure", time: "12.30", am: "Am"),
    SlawtTimeModel(name: "Aser", time: "3.30", am: "Am"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/home.jpeg"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),

              TimerWidget(),
              const Text(
                "Fager",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                ),
              ),
              //قائمة الصلوات
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff9c682d),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: List.generate(
                      4,
                      (index) => SalwatTimeWidget(
                            slawtTimeModel: listSlaeatTime[index],
                          )),
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                children: [
                  //الصوت
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(QuranScreen.nameRoute);
                      },
                      child: NivgaterScreenList("assets/images/adeia.jpg")),
                  SizedBox(width: 50,),
               //السبحه
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(TasbehScreen.nameRoute);
                      },
                      child: NivgaterScreenList("assets/images/sebha.jpg")),
                  SizedBox(width: 50,),
                  // اسماء الله الحسنى
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(AsmaAllahScreen.nameRoute);
                      },
                      child: NivgaterScreenList("assets/images/logo.png")),





                ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





