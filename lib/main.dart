import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Text(
              "ANIMATOR",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 40.0,
                  wordSpacing: 10.0,
                  fontWeight: FontWeight.bold),
            ),
            splashIconSize: 78.0,
            nextScreen: FeedbackForm(),
            splashTransition: SplashTransition.sizeTransition,
            pageTransitionType: PageTransitionType.downToUp,
            backgroundColor: Color(0xff0F3057)));
  }
}
