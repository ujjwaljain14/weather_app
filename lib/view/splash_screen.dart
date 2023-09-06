import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/res/assets/images/image_assets.dart';
import 'package:weather_app/res/colors/app_color.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>  const HomeScreen())));

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child:  Image(
          image: const AssetImage(ImageAssets.splashscreenImage),
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      ),
    );
  }
}
