import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';

class HomeScreen extends StatelessWidget {

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    print("home screen load");
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text(
            "fuck home"
          )
        ),
      ),
    );
  }
}
