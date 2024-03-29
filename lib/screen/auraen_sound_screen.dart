import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../model/sound_data.dart';
import '../widget/item_widget.dart';

class QuranScreen extends StatefulWidget {
  static const String nameRoute = "QuranScreen";

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<String> listNameDoaa = [
    "دعاء التراويح",
    "دعاء الذهاب الى المسجد",
    "دعاء ",
    "دعاء التراويح",
    "دعاء التراويح",
    "دعاء رمضان",
    "دعاء التراويح",
    "دعاء ختم القران",
  ];
  List<SoundModel> list = [];
  late AudioPlayer player;
  bool play = false;
  bool isPlay = false;
  List<String> listNameFileSound =
      List.generate(8, (index) => "sound/audio${1 + index}.mp3");
  Color color = Colors.white;
  int x = -1;

  @override
  void initState() {
    player = AudioPlayer();

    list = List.generate(
      8,
      (index) => SoundModel(
          index: index,
          nameDoaa: listNameDoaa[index],
          soundName: "sound/audio${1 + index}.mp3"),
    );
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("hello");
    print("x $x");
    print("play $play");
    print("isPlay $isPlay");
    return Scaffold(
      appBar: AppBar(
        title: const Text("quran app"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < 2; i++)
            InkWell(
              onTap: () {
                if (x == i) {
                  if (isPlay == true) {
                    onPause();
                  }else{
                    onResume();
                  }
                }else{
                  onPlay(listNameFileSound[i]);
                }

                // (x != i && !play) ? onPlay(listNameFileSound[i]) : onPause();

                setState(() {
                  x = i;
                });
              },
              child: Container(
                width: 100,
                height: 200,
                color: x == i ? Colors.red : color,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              listNameDoaa[i],
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                //-1 i=1
                                //0=0     t         f
                                // f
                                (x == i && isPlay)
                                    ? Icons.pause
                                    : Icons.play_circle,
                                size: 45,
                                color: Colors.grey[200],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                onStop();
                setState(() {
                  play = false;
                  x = -2;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      //-1 i=1
                      Icons.stop_circle,
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
      if (play) {
        onStop();
        return;
      } else {
        await player.play(AssetSource(sound));
        setState(() {
          isPlay = true;
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
        isPlay = false;
      });

      player.stop();
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }

  onPause() {
    try {
      print("Puseeeeeeeeeeeeeeeeeeee");
      setState(() {
        isPlay = false;
      });
      player.pause();
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }
  onResume() {
    try {
      print("Stop");
      setState(() {
        isPlay = true;
      });
      player.resume();
    } on Exception catch (e) {
      print("error ${e.toString()}");
    }
  }
}

// body: Column(
//   children: List.generate(
//       2,
//       (index) => Expanded(
//             child: ItemWidget(
//               player: player,
//               sound: list[index],
//               x: -1,
//             ),
//           )),
// ),
