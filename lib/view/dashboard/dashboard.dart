import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_media_app_flutter/view/dashboard/profile/profile_view.dart';
import 'package:social_media_app_flutter/view_model/services/session_mangar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final conttroller = PersistentTabController(initialIndex: 0);
  List<Widget> Screen() {
    return [
      Text("home"),
      Text("home"),
      Text("home"),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> item() {
    return [
      PersistentBottomNavBarItem(icon: Icon(Icons.home)),
      PersistentBottomNavBarItem(icon: Icon(Icons.search)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.whatsapp),
          activeColorPrimary: Colors.greenAccent,
          activeColorSecondary: Colors.green),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person_outline,
          ),
          activeColorSecondary: Colors.black),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("logOut"),
        actions: [
          IconButton(
              onPressed: () {
                SessionConttroller().userId = '';

                final _auths = FirebaseAuth.instance;
                _auths.signOut().then((value) {
                  Navigator.pushNamed(context, 'login');
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: SafeArea(
        child: PersistentTabView(
          context,
          screens: Screen(),
          items: item(),
        ),
      ),
    );
  }
}
