import 'dart:math';
import 'package:flutter/material.dart';
import '../item_widget.dart';
import '../model/sound_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Sound> list = List.generate(
    7,
        (index) => Sound(
        color: Color(Random().nextInt(0xffacacac)),
        sound: "assets/sounds/note${1 + index}.wav"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(
            list.length,
                (index) => Expanded(
                child: ItemWidget(
                  sound: list[index],
                ))),
      ),
    );
  }
}