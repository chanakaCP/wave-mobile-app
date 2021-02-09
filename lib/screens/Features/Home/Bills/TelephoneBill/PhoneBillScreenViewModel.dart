import 'package:flutter/widgets.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';

class PhoneBillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  final formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final confirmMobileController = TextEditingController();
  final amountController = TextEditingController();
  final confirmAmountController = TextEditingController();

  bool isError = false;
  bool isLoading = false;
  bool isSuccess = false;
  String serviceProvider, mobileNumberFormat;
  String error = '';

  void initialise() {
    mobileController.text = "";
    confirmMobileController.text = "";
    amountController.text = "";
    confirmAmountController.text = "";

    if (serviceProvider == "SLT" || serviceProvider == "Lanka Bell") {
      mobileNumberFormat = "(0***)";
    } else {
      mobileNumberFormat = "(07***)";
    }

    notifyListeners();
  }

  onClickProceed() async {
    if (formKey.currentState.validate()) {
      isLoading = true;
      isError = false;

      if (mobileController.text != confirmMobileController.text) {
        isLoading = false;
        isError = true;
        error = "Mobile number doesn't match";
      } else if (amountController.text != confirmAmountController.text) {
        isLoading = false;
        isError = true;
        error = "Amount doesn't match";
      } else {
        if (mobileController.text.length == 10) {
          if (checkNumberValidity() == true) {
            isLoading = false;
            isSuccess = true;
            mobileController.text = "";
            confirmMobileController.text = "";
            amountController.text = "";
            confirmAmountController.text = "";
          } else {
            isLoading = false;
            isError = true;
            error = "Number didn't match to the service provider";
          }
        } else {
          isLoading = false;
          isError = true;
          error = "Number should have 10 digits";
        }
      }
      notifyListeners();
    }
  }

  bool checkNumberValidity() {
    String checkString = mobileController.text.substring(0, 3);
    print(checkString);

    if (serviceProvider == "Mobitel" &&
        (checkString == "070" || checkString == "071")) {
      return true;
    } else if (serviceProvider == "Dialog" &&
        (checkString == "074" ||
            checkString == "076" ||
            checkString == "077")) {
      return true;
    } else if ((serviceProvider == "Hutch" || serviceProvider == "Etisalat") &&
        (checkString == "078" || checkString == "072")) {
      return true;
    } else if (serviceProvider == "Airtel" && checkString == "075") {
      return true;
    } else if ((serviceProvider == "SLT" || serviceProvider == "Lanka Bell") &&
        mobileController.text.substring(0, 1) == "0") {
      return true;
    } else {
      return false;
    }
  }
}
