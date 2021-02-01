import 'package:flutter/material.dart';

class WelcomeScreenViewModel extends ChangeNotifier {
  bool showSignInScreen;

  initialState() {
    showSignInScreen = true;
  }

  changeBody() {
    showSignInScreen = !showSignInScreen;
    notifyListeners();
  }
}
