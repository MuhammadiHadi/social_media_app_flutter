import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/utils/component/main_button.dart';

import '../../utils/component/input_text_field.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();

  final GlobalKey _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    String? fonteight;
    String fontsize;

    final style = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 23,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    "Welcome to Social People",
                    style: style,
                  ),
                ),
                Text(
                  "Enter your email address\n to connect your account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * .05,
                ),
                Form(
                    key: _key,
                    child: Column(
                      children: [
                        InputTextField(
                          hint: "Email",
                          obscureText: false,
                          iconData: Icons.email_outlined,
                          focusNode: emailfocusnode,
                          keyboardType: TextInputType.emailAddress,
                          fieldSetter: (value) {},
                          formFieldValidator: (value) {
                            return value.isEmpty ? "Enter valide email" : null;
                          },
                          controller: _emailController,
                        ),
                        InputTextField(
                          hint: "Password",
                          iconData: Icons.lock_outline,
                          // righticon: Icons.visibility,
                          obscureText: true,
                          focusNode: passwordfocusnode,
                          fieldSetter: (value) {},
                          formFieldValidator: (value) {
                            return value.isEmpty
                                ? "Enter valida password"
                                : null;
                          },
                          controller: _passwordController,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "ForgetPassword",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            )),
                      ],
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                MainButton(
                  title: "LOGIN",
                  color: Colors.green,
                  textcolor: Colors.white,
                  loading: false,
                  onPress: () {},
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: Text.rich(
                    TextSpan(text: "Don't have an account?", children: [
                      TextSpan(
                          text: " SignUp",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15))
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
