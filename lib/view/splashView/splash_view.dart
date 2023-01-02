import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:social_media_app_flutter/view/login/login_view.dart';

import '../../view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SplashServices services = SplashServices();
    services.SplashTimer(context);
  }

  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: GoogleFonts.fascinateInline(
                  fontSize: 45, color: Colors.amber),
              child: AnimatedTextKit(
                  animatedTexts: [WavyAnimatedText("Coder Crew")]),
            ),

            // Image.asset("assets/images/social.jpg"),
          ],
        ),
      ),
    );
  }
}
