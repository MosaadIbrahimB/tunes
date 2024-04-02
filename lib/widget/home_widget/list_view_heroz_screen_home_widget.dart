import 'package:flutter/material.dart';

import '../../screen/asmaa_allah_screen.dart';
import '../../screen/dowa_sound_screen.dart';
import 'nivgater_list_screen_widget.dart';
import '../../screen/tasepah_screen.dart';

class ListViewHerozScreenOfHomeWidget extends StatefulWidget {
  const ListViewHerozScreenOfHomeWidget({super.key});

  @override
  State<ListViewHerozScreenOfHomeWidget> createState() => _ListViewHerozScreenOfHomeWidgetState();
}
class _ListViewHerozScreenOfHomeWidgetState extends State<ListViewHerozScreenOfHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        //الصوت
        itemList(nameScreen:DowaScreen.nameRoute ,namePathImage: "adeia.jpg",title: "دعاء"),
        const SizedBox(width: 40),
        //السبحه
        itemList(nameScreen:TasbehScreen.nameRoute ,namePathImage: "sebha.jpg",title: "سبحه"),
        const SizedBox(width: 40),
        // اسماء الله الحسنى
        itemList(nameScreen:AsmaAllahScreen.nameRoute ,namePathImage: "logo.png",title: "اسماء الله الحسنى"),
      ],
    );
  }

  Widget itemList({String nameScreen="", String namePathImage="",String title="",}){

    return   InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(nameScreen);
        },
        child: NivgaterScreenListwidget("assets/images/$namePathImage",title));


  }
}
