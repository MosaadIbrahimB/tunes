
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunes/screen/asmaa_allah_screen.dart';
import 'package:tunes/screen/dowa_sound_screen.dart';
import 'package:tunes/screen/home_screen.dart';
import 'package:tunes/screen/splash_screen.dart';
import 'package:tunes/screen/tasepah_screen.dart';
import 'package:tunes/shared/dowa_provider_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( ChangeNotifierProvider(
      create: (context)=>DowaProviderModel(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.transparent,

      ),
      home:SplashScreen(),
      routes: {
        SplashScreen.nameRoute: (context) => SplashScreen(),
        HomeScreen.nameRoute: (context) => HomeScreen(),
        AsmaAllahScreen.nameRoute: (context) => AsmaAllahScreen(),
        DowaScreen.nameRoute: (context) => DowaScreen(),
        TasbehScreen.nameRoute: (context) => TasbehScreen(),
      },
    );
  }
}

