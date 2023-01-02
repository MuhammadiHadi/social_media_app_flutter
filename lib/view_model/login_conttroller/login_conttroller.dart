import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view/dashboard/dashboard.dart';
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

  Future<void> GoogleSign_in(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential

      UserCredential result = await _auths.signInWithCredential(authCredential);
      User? user = result.user;

      SessionConttroller().userId = user!.uid.toString();
      print(user.toString());

      if (result != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
}
