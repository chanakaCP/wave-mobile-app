import 'package:flutter/widgets.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/RegisterUser.dart';

class SignUpScreenViewModel extends ChangeNotifier {
  RegisterUser regUser = new RegisterUser();
  final AuthService authService = AuthService();

  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passController = TextEditingController();

  bool isError = false;
  bool isLoading = false;
  String error = '';

  void initialise() {
    userNameController.text = '';
    passController.text = '';
    emailController.text = '';
    mobileController.text = '';
    notifyListeners();
  }

  onClickSignUp() async {
    if (formKey.currentState.validate()) {
      isLoading = true;
      isError = false;
      notifyListeners();

      regUser.userName = userNameController.text.trim();
      regUser.mobileNumber = mobileController.text.trim();
      regUser.email = emailController.text.trim();
      regUser.password = passController.text.trim();

      dynamic result = await authService.registerWithEmailAndPassword(regUser);
      if (result == null) {
        error = 'User not created..., minimum password length';
        isLoading = false;
        isError = true;
        notifyListeners();
      }
    }
  }
}
