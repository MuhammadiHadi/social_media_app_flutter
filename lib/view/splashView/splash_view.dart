import 'dart:async';

import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/social.jpg"),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(
            color: Colors.amberAccent,
          ),
        ],
      ),
    );
  }
}
