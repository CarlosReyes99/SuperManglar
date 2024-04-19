import 'package:app_manglar/presentation/Views/navigator_screens.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff28C8CE),
        body: Center(
          child: ListView(
            children: [
              Lottie.asset(
                'assets/animations/animation.json',
                width: 600,
                height: 600,
                fit: BoxFit.contain,
                controller: _controller,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _controller
                    ..duration = const Duration(seconds: 5)
                    ..forward();

                  _controller.addListener(() {
                    if (_controller.isCompleted) {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(seconds: 2),
                          // Elige el tipo de transición que prefieras
                          child: const HomePage(),
                        ),
                      );
                    }
                  });
                },
              ),
              Center(
                child: SizedBox(
                  width: 270.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MadimiOne',
                    ),
                    textAlign: TextAlign.center,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText('¡Descubra el tesoro!', textAlign: TextAlign.center),
                        FadeAnimatedText('¡Manglares!', textAlign: TextAlign.center),
                      ],
                      onTap: () {},
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
