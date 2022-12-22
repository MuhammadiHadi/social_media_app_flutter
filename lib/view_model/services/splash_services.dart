import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/route/route.dart';

class SplashServices {
  void SplashTimer(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, 'login');
    });
  }
}
