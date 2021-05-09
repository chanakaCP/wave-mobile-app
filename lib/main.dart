import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wave_mobile_app/screens/App.dart';

import 'Services/AuthService.dart';
import 'models/User.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser>.value(
      initialData: null,
      value: AuthService().user,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: App(),
      ),
    );
  }
}
