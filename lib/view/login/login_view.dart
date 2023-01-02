import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_flutter/src/color/color.dart';
import 'package:social_media_app_flutter/utils/component/main_button.dart';
import 'package:social_media_app_flutter/utils/component/soical_button.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view_model/login_conttroller/login_conttroller.dart';

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

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Welcome!",
                        style: GoogleFonts.laila(fontSize: 34)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: DefaultTextStyle(
                    style: GoogleFonts.laila(fontSize: 12, color: Colors.black),
                    child: Container(
                      height: 20,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                              'Enter your email address to connect your account')
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ),
                  ),
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
                          fieldSetter: (value) {
                            Utils.fieldFocus(
                                context, emailfocusnode, passwordfocusnode);
                          },
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

                          formFieldValidator: (value) {
                            return value.isEmpty
                                ? "Enter valida password"
                                : null;
                          },
                          controller: _passwordController,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'ForgetPassword');
                              },
                              child: Text(
                                "ForgetPassword",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            )),
                      ],
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginConttroller(),
                  child: Consumer<LoginConttroller>(
                    builder: (context, provider, child) {
                      return Column(
                        children: [
                          MainButton(
                            title: "LOGIN",
                            color: AppColor.black,
                            textcolor: AppColor.white,
                            loading: provider.loading,
                            onPress: () {
                              if (_key.currentState!.validate()) {
                                provider.Login(context, _emailController.text,
                                    _passwordController.text);
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'signup');
                            },
                            child: Text.rich(
                              TextSpan(
                                  text: "Don't have an account?",
                                  children: [
                                    TextSpan(
                                        text: " SignUp",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 15))
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          SocialButton(
                            onPress: () {
                              provider.GoogleSign_in(context);
                            },
                            image: "assets/images/google.png",
                            title: " Google",
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SocialButton(
                            image: "assets/images/facebook.png",
                            title: "Facebook",
                            color: Colors.white,
                          ),
                        ],
                      );
                    },
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
