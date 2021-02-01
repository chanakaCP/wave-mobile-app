import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import '../models/User.dart';
import 'Features/Auth/WelcomeScreenView.dart';
import 'Features/Home/HomeScreen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final user = Provider.of<LocalUser>(context);
    if (user == null) {
      return WelcomeScreen();
    } else {
      return HomeScreen(
        user: user,
      );
    }
  }
}
