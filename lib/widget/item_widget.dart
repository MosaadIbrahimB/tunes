import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import '../model/sound_data.dart';

class ItemWidget extends StatefulWidget {
  Sound sound;
  ItemWidget({required this.sound});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isPress = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Player ${widget.sound.index + 1}",style: const TextStyle(
              fontSize: 18,

            ),),
          )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {

                OnStop(widget.sound.sound);
              },
              child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.stop_circle,
                    size: 45,
                    color: Colors.grey[200],
                  )),
            ),
          ),
SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isPress = !isPress;
                });
                onPlay(widget.sound.sound);
              },
              child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.play_circle,
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
  onPlay(String sound) async {
    try {
      AssetsAudioPlayer.newPlayer().open(
        Audio(sound),
        autoStart: true,
        showNotification: true,
      );

      // final player = AudioPlayer();
      // await player.play(UrlSource(sound));
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }
  OnStop(String sound)async{
    try {
      AssetsAudioPlayer.newPlayer().stopped;

      // final player = AudioPlayer();
      // await player.play(UrlSource(sound));
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }
}
/*  child: ListTile(
          title: Text("Player ${widget.sound.index + 1}"),
          subtitle: GestureDetector(
            onTap: () {
              setState(() {
                isPress = !isPress;
              });
              onPlay(widget.sound.sound);
            },
            child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: Icon(
                  isPress ? Icons.play_circle : Icons.stop_circle,
                  size: 45,
                  color: Colors.grey[200],
                )),
          ),
        ),*/
