import 'package:flutter/cupertino.dart';

import '../../../../../Services/AuthService.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final confirmPassController = TextEditingController();
  final passController = TextEditingController();
  final oldPassController = TextEditingController();

  bool isError = false;
  bool isLoading = false;
  bool isSuccess = false;
  String error = '';

  void initialise() {
    confirmPassController.text = '';
    passController.text = '';
    oldPassController.text = '';
    notifyListeners();
  }

  onClickChangePassword() async {
    if (formKey.currentState.validate()) {
      isLoading = true;
      isError = false;

      if (passController.text == oldPassController.text) {
        isLoading = false;
        isError = true;
        error = "Password must be different";
        confirmPassController.text = '';
        passController.text = '';
      } else if (passController.text != confirmPassController.text) {
        isLoading = false;
        isError = true;
        error = "Passwords do not match";
      } else {
        authService.changePassword(passController.text);
        isLoading = false;
        isSuccess = true;
        confirmPassController.text = '';
        passController.text = '';
        oldPassController.text = '';
      }
      notifyListeners();
    }
  }
}
