import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEFFAC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                'assets/animations/homeAnimation.json',
                width: 800,
                height: 800,
                fit: BoxFit.contain,
                repeat: true,
                animate: true,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Player.play('audio/home_aud.mp3');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Lottie.asset(
                  'assets/animations/playAnimation.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                  repeat: true,
                  animate: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Player {
  static play(String src) async {
    final player = AudioPlayer();
    await player.play(AssetSource(src));
  }
}