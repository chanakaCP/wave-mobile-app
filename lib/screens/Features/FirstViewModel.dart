import 'package:flutter/cupertino.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/paymentService.dart';

import 'Home/HomeScreenView.dart';
import 'profile/ProfileScreenView.dart';

class FirstViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  int currentIndex = 0;

  final List<Widget> children = [
    HomeScreen(),
    ProfileScreen(),
  ];

  initialise() {
    StripeService.init();
  }

  void onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
