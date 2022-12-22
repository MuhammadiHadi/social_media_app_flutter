import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_flutter/utils/component/main_button.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view_model/forget_password_conttroller/forget_password_conttroller.dart';
import 'package:social_media_app_flutter/view_model/login_conttroller/login_conttroller.dart';

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
                    "Forget Password",
                    style: style,
                  ),
                ),
                Text(
                  "Enter your email address\n to reset your password",
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
                          fieldSetter: (value) {
                            Utils.fieldFocus(
                                context, emailfocusnode, passwordfocusnode);
                          },
                          formFieldValidator: (value) {
                            return value.isEmpty ? "Enter valide email" : null;
                          },
                          controller: _emailController,
                        ),
                        // InputTextField(
                        //   hint: "Password",
                        //   iconData: Icons.lock_outline,
                        //   // righticon: Icons.visibility,
                        //   obscureText: true,
                        //   focusNode: passwordfocusnode,
                        //
                        //   formFieldValidator: (value) {
                        //     return value.isEmpty
                        //         ? "Enter valida password"
                        //         : null;
                        //   },
                        //   controller: _passwordController,
                        // ),
                        // Align(
                        //     alignment: Alignment.topRight,
                        //     child: Text(
                        //       "ForgetPassword",
                        //       style: TextStyle(
                        //           decoration: TextDecoration.underline),
                        //     )),
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
                        color: Colors.green,
                        textcolor: Colors.white,
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
                // InkWell(
                //   onTap: () {
                //     Navigator.pushNamed(context, 'signup');
                //   },
                //   child: Text.rich(
                //     TextSpan(text: "Don't have an account?", children: [
                //       TextSpan(
                //           text: " SignUp",
                //           style: TextStyle(
                //               decoration: TextDecoration.underline,
                //               fontSize: 15))
                //     ]),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
