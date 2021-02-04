import 'package:flutter/cupertino.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';

import 'Home/HomeScreen.dart';
import 'profile/ProfileScreenView.dart';

class FirstViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  int currentIndex = 0;

  final List<Widget> children = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // String getAppbarTitle(int index) {
  //   String title;
  //   switch (index) {
  //     case 0:
  //       title = "Home";
  //       break;
  //     case 1:
  //       title = "profile";
  //       break;
  //   }
  //   return title;
  // }
}
