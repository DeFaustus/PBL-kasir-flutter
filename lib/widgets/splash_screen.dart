import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pbl_kasir/widgets/homepage.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      alignment: Alignment.center,
      child: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'assets/logo/sirdi.png',
            fit: BoxFit.cover,
          ),
          nextScreen: HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.white),
    );
  }
}
