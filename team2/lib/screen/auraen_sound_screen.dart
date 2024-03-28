import 'dart:math';

import 'package:flutter/material.dart';

import '../model/sound_data.dart';
import '../widget/item_widget.dart';

class QuranScreen extends StatefulWidget {
  static const String nameRoute="QuranScreen";

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<Sound> list = List.generate(
    8,
        (index) => Sound(
          index: index,
        color: Color(Random().nextInt(0xffacacac)),
        sound: "assets/sound/audio${1 + index}.mp3"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: List.generate(
            list.length,
                (index) => Expanded(
                  child: ItemWidget(
                    sound: list[index],
                  ),
                )),
      ),
    );
  }



}