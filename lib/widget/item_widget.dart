import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../model/sound_data.dart';

class ItemWidget extends StatefulWidget {
  SoundModel sound;
  AudioPlayer player = AudioPlayer();
  int x ;
  ItemWidget({required this.sound, required this.player,required this.x});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool play = false;
  bool changColor = true;

  @override
  Widget build(BuildContext context) {
    print("x ${ widget. x}");
    print("widget.sound.index ${widget.sound.index}");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.sound.nameDoaa,
                style: const TextStyle(
                    fontSize: 18,
                   ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  onPlay(widget.sound.soundName);
                },
                child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      !play ? Icons.play_circle : Icons.pause,
                      size: 45,
                      color: Colors.grey[200],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

//start play =false
  onPlay(String sound) async {
    try {
      if (play) {
        onStop();
        return;
      } else {
        await widget.player!.play(AssetSource(widget.sound.soundName));
        setState(() {
          // x = -2;
          // x = widget.sound.index;
          play = true;
        });
      }
      print(play);
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }

  onStop() {
    try {
      print("Stop");
      setState(() {
        // x = -1;
        play = false;
      });

      print("play in stop =$play");
      print("x in stop =${ widget. x}");

      widget.player.stop();
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }
}