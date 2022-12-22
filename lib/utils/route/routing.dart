import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/utils/route/route.dart';
import 'package:social_media_app_flutter/view/dashboard/dashboard.dart';
import 'package:social_media_app_flutter/view/login/login_view.dart';
import 'package:social_media_app_flutter/view/singup/signup_view.dart';
import 'package:social_media_app_flutter/view/splashView/splash_view.dart';

class Routing {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.SplashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoute.LoginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case AppRoute.SignUPView:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case AppRoute.DashboardScreen:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text("no page found thank you")),
          );
        });
    }
  }
}
