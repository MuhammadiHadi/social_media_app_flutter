import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_flutter/src/color/color.dart';
import 'package:social_media_app_flutter/utils/component/main_button.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view_model/Signup_conttroller/signup_controller.dart';

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

  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  // @override
  // void initState() {
  //
  //
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _userNameController.dispose();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ChangeNotifierProvider(
              create: (_) => SignupController(),
              child: Consumer<SignupController>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            style: GoogleFonts.laila(
                                fontSize: 12, color: Colors.black),
                            child: Container(
                              height: 20,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(
                                      'Enter your email address to register your account')
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
                                  hint: "User Name",
                                  obscureText: false,
                                  iconData: Icons.person_outline,
                                  focusNode: userNamefocusnode,
                                  keyboardType: TextInputType.text,
                                  fieldSetter: (value) {
                                    Utils.fieldFocus(context, userNamefocusnode,
                                        emailfocusnode);
                                  },
                                  formFieldValidator: (value) {
                                    return value.isEmpty ? "Enter Name" : null;
                                  },
                                  controller: _userNameController,
                                ),
                                InputTextField(
                                  hint: "Email",
                                  obscureText: false,
                                  iconData: Icons.email_outlined,
                                  focusNode: emailfocusnode,
                                  keyboardType: TextInputType.emailAddress,
                                  fieldSetter: (value) {
                                    Utils.fieldFocus(context, emailfocusnode,
                                        passwordfocusnode);
                                  },
                                  formFieldValidator: (value) {
                                    return value.isEmpty ? "Enter Email" : null;
                                  },
                                  controller: _emailController,
                                ),
                                InputTextField(
                                  hint: "Password",
                                  iconData: Icons.lock_outline,
                                  obscureText: true,
                                  focusNode: passwordfocusnode,
                                  formFieldValidator: (value) {
                                    return value.isEmpty
                                        ? "Enter valida password"
                                        : null;
                                  },
                                  controller: _passwordController,
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                MainButton(
                                  title: "LOGIN",
                                  color: AppColor.black,
                                  textcolor: AppColor.white,
                                  loading: provider.loading,
                                  onPress: () {
                                    if (_key.currentState!.validate()) {
                                      provider.sigup(
                                          context,
                                          _userNameController.text,
                                          _emailController.text,
                                          _passwordController.text);
                                    }
                                  },
                                ),
                              ],
                            )),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text.rich(
                            TextSpan(
                                text: "Already have an account?",
                                children: [
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
                  );
                },
              ),
            )),
      ),
    );
  }
}
