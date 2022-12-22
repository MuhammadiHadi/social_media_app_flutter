import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_app_flutter/utils/route/route.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view_model/services/session_mangar.dart';

class SignupController with ChangeNotifier {
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('user');
  final _auths = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void sigup(
      BuildContext context, String username, String email, String password) {
    setLoading(true);
    try {
      _auths
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionConttroller().userId = value.user!.uid.toString();
        reference.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'username': username,
          'profile': '',
        }).then((value) {
          setLoading(false);
          Utils.toastMessage("account create successfully");
          Navigator.pushNamed(context, 'login');
        }).onError((error, stackTrace) {
          setLoading(false);
          Utils.toastMessage(error.toString());
        });
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
