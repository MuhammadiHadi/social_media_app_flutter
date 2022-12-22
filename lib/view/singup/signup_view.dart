import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/utils/component/main_button.dart';

import '../../utils/component/input_text_field.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  final userNamefocusnode = FocusNode();

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
                  "Enter your email address\n to register your account",
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
                          hint: "User Name",
                          obscureText: false,
                          iconData: Icons.person_outline,
                          focusNode: userNamefocusnode,
                          keyboardType: TextInputType.text,
                          fieldSetter: (value) {},
                          formFieldValidator: (value) {
                            return value.isEmpty ? "Enter valida email" : null;
                          },
                          controller: _userNameController,
                        ),
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
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text.rich(
                    TextSpan(text: "Already have an account?", children: [
                      TextSpan(
                          text: " Sign_in",
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
