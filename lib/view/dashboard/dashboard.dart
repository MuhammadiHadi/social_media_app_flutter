import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/view_model/services/session_mangar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SessionConttroller().userId.toString()),
        actions: [
          IconButton(
              onPressed: () {
                SessionConttroller().userId = '';
                Navigator.pushNamed(context, 'login');
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
