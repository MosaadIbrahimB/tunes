import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tunes/screen/asma_allah_screen.dart';
import 'package:tunes/screen/auraen_sound_screen.dart';
import 'package:tunes/screen/home_screen.dart';

import 'package:tunes/screen/splash_screen.dart';
import 'package:tunes/screen/tasepahScreen.dart';

import 'model/sound_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuranScreen(),
      routes: {
        SplashScreen.nameRoute: (context) => SplashScreen(),
        HomeScreen.nameRoute: (context) => HomeScreen(),
        AsmaAllahScreen.nameRoute: (context) => AsmaAllahScreen(),
        QuranScreen.nameRoute: (context) => QuranScreen(),
        TasbehScreen.nameRoute: (context) => TasbehScreen(),
      },
    );
  }
}

class Test extends StatelessWidget {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                 player.play(AssetSource("sound/audio1.mp3"));
                print("play");
              },
              child: Text("play"),
            ),
            ElevatedButton(
              onPressed: () {
                player.stop();
                print("stop");
              },
              child: Text("stop"),
            ),
          ],
        ),
      ),
    );
  }
}
