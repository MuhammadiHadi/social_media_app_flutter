import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_media_app_flutter/utils/component/input_text_field.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';

import '../services/session_mangar.dart';

class ProfileConttroller with ChangeNotifier {
  final _nameconttroller = TextEditingController();
  final _phoneconttroller = TextEditingController();
  final namefocus = FocusNode();
  final phonefocus = FocusNode();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  DatabaseReference reference = FirebaseDatabase.instance.ref().child('user');

  firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();
  XFile? _image;
  XFile? get image => _image;

  Future<void> pickImageformGallery(BuildContext context) async {
    final pickerfile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickerfile != null) {
      _image = XFile(pickerfile.path);
      uploadImage(context);

      notifyListeners();
    }
  }

  Future<void> pickImageformCamera(BuildContext context) async {
    final pickerfile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickerfile != null) {
      _image = XFile(pickerfile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  void pickImage(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Upload Image")),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      pickImageformCamera(context);
                    },
                    leading: Icon(Icons.camera_alt_outlined),
                    title: Text("Camera"),
                  ),
                  ListTile(
                    onTap: () {
                      pickImageformGallery(context);
                    },
                    leading: Icon(Icons.image),
                    title: Text("Gallery"),
                  ),
                ],
              ),
            ),
          );
        });
    notifyListeners();
  }

  void uploadImage(BuildContext context) async {
    setLoading(true);
    firebase_storage.Reference storage_ref = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + SessionConttroller().userId.toString());

    firebase_storage.UploadTask uploadTask =
        storage_ref.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storage_ref.getDownloadURL();

    reference
        .child(SessionConttroller().userId.toString())
        .update({'profile': newUrl.toString()}).then((value) {
      setLoading(false);
      Utils.toastMessage("Profile Update Successfully");
      _image = null;
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }

  void updatedata(BuildContext context, String name) async {
    _nameconttroller.text = name;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("Update field")),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InputTextField(
                    iconData: Icons.person_outline,
                    focusNode: namefocus,
                    formFieldValidator: (value) {},
                    fieldSetter: (value) {},
                    controller: _nameconttroller,
                    keyboardType: TextInputType.text,
                    hint: "enter name",
                    obscureText: false,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "cancel",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok", style: TextStyle(color: Colors.black))),
            ],
          );
        });
  }
}
