import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DowaProviderModel extends ChangeNotifier{

 static List<String> listNameDoaa = [
    "دعاء الشيخ السديسي",
    "دعاء الذهاب الى المسجد",
    "دعاء اللهم لك الحمد كله",
    "دعاء الشيخ محمد جبريل",
    "دعاء الخروج من المنزل",
    "دعاء التراويح",
    "دعاء الشيخ محمد البراك",
    "دعاء ختم القران",
  ];


  int index=0;


  static AudioPlayer player = AudioPlayer();
  int currentIndex=-2;
 bool isPlay = false;
 Duration soundLengthAll = const Duration();
 Duration currentDuration = const Duration();
 StreamSubscription? playerCompleteSubscription;

  static List<String> listNameFileSound =
  List.generate(8, (index) => "sound/audio${1 + index}.mp3");

  end(){
    player.dispose();
    player.stop();
    // index=0;
 // notifyListeners();
  }

onClick(int index){
  // print("currentIndex----------- $currentIndex");
  // print("index----------- $index");
  this.index=index;
if(currentIndex != index){
  currentIndex=index;
  onPlay(index);
  checkComplete();
  notifyListeners();

}else{
  onPause();
  currentIndex=-2;
  notifyListeners();
}
  notifyListeners();
}

 onPlay(int index) {
   isPlay=true;
  player.play(AssetSource(listNameFileSound[index]));
  soundLength();
  soundCurrent();
  notifyListeners();
}

init(){
  onStop();
  index=0;
  notifyListeners();
}


 onStop() {
  player.stop();
  currentDuration = const Duration(seconds: 0);
  onSeek(0);
   currentIndex=-2;
  isPlay=false;
   notifyListeners();

}

 onPause() {
   isPlay=false;
  player.pause();
}

 soundLength() {
  player.onDurationChanged.listen((d) {
    soundLengthAll = d;
notifyListeners();
  });
  print(soundLengthAll);
}

 soundCurrent() {
  player.onPositionChanged.listen((d) {
    currentDuration = d;
    notifyListeners();

  });

  // print("*/*/*/*/*/*/");
}

 onSeek(int newPosition) {
  player.seek(Duration(seconds: newPosition));
  print(currentDuration);
}

 checkComplete() {
  playerCompleteSubscription = player.onPlayerComplete.listen((state) {

    onStop();
notifyListeners();
  });
}
}