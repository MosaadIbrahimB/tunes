import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/dowa_provider_model.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
static const String nameRoute="SplashScreen";


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   Timer(const Duration(seconds: 1), () {
     Navigator.of(context).pushReplacementNamed(HomeScreen.nameRoute);
   });
  }

  @override
  Widget build(BuildContext context) {
    DowaProviderModel.player.dispose();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/splash_image.png"))
      ),
    );
  }
}


