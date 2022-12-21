import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/utils/component/main_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainButton(
            title: "LOGIN",
            color: Colors.green,
            textcolor: Colors.white,
            loading: false,
            onPress: () {},
          )
        ],
      ),
    );
  }
}
