import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_flutter/src/color/color.dart';
import 'package:social_media_app_flutter/utils/component/main_button.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view_model/forget_password_conttroller/forget_password_conttroller.dart';

import '../../utils/component/input_text_field.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Forget Password!",
                        style: GoogleFonts.laila(fontSize: 25)),
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
                              'Enter your email address to Reset your password')
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
                      ],
                    )),
                SizedBox(
                  height: height * 0.03,
                ),
                ChangeNotifierProvider(
                  create: (_) => ForgetPasswordConttroller(),
                  child: Consumer<ForgetPasswordConttroller>(
                    builder: (context, provider, child) {
                      return MainButton(
                        title: "RESET",
                        color: AppColor.black,
                        textcolor: AppColor.white,
                        loading: provider.loading,
                        onPress: () {
                          if (_key.currentState!.validate()) {
                            provider.forgetPassword(
                                context, _emailController.text);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
