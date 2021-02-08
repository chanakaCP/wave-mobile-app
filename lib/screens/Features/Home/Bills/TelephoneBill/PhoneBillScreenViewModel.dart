import 'package:flutter/widgets.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';

class PhoneBillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  String serviceProvider;

  final formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final confirmMobileController = TextEditingController();
  final amountController = TextEditingController();
  final confirmAmountController = TextEditingController();

  bool isError = false;
  bool isLoading = false;
  bool isSuccess = false;
  String error = '';

  void initialise() {
    mobileController.text = "";
    confirmMobileController.text = "";
    amountController.text = "";
    confirmAmountController.text = "";
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
        isLoading = false;
        isSuccess = true;
        mobileController.text = "";
        confirmMobileController.text = "";
        amountController.text = "";
        confirmAmountController.text = "";
      }
      notifyListeners();
    }
  }
}
