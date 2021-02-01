import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/User.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomButton.dart';

class HomeScreen extends StatelessWidget {
  final LocalUser user;

  HomeScreen({@required this.user});

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    print("home screen load");
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: CustomButton(
            title: "logout",
            bgColor: Colors.blue,
            textColor: Colors.white,
            callback: () async {
              await authService.signOut();
            },
          ),
        ),
      ),
    );
  }
}
