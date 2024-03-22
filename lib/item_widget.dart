import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'model/sound_data.dart';

class ItemWidget extends StatelessWidget {
  Sound sound;
  ItemWidget({required this.sound});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap( sound.sound);
      },
      child: Container(
        color: sound.color,
      ),
    );
  }
  onTap(String sound){
    try {
      AssetsAudioPlayer.newPlayer().open(
        Audio(sound),
        // autoStart: true,
        // showNotification: true,
      );
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }
}
