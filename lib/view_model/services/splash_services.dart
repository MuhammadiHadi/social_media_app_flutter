import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/view_model/services/session_mangar.dart';

import '../../utils/route/route.dart';

class SplashServices {
  void SplashTimer(BuildContext context) {
    final _auths = FirebaseAuth.instance;

    final user = _auths.currentUser;
    if (user != null) {
      SessionConttroller().userId = user.uid.toString();
      Timer(Duration(milliseconds: 3000), () {
        Navigator.pushNamed(context, 'dashboard');
      });
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.pushNamed(context, 'login');
      });
    }
  }
}
