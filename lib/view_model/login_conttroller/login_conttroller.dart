import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view_model/services/session_mangar.dart';

class LoginConttroller with ChangeNotifier {
  final _auths = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void Login(BuildContext context, String email, String password) {
    setLoading(true);
    try {
      _auths
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionConttroller().userId = value.user!.uid.toString();
        setLoading(false);
        Utils.toastMessage("login successfully");
        Navigator.pushNamed(context, 'dashboard');
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
