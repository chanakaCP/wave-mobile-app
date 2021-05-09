import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/snackbar/CustomSuccessSnackBar.dart';
import 'package:wave_mobile_app/screens/Features/profile/PaymentInfo/cardDetails/PaymentInfoScreenView.dart';

class WaterBillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  final formKey = GlobalKey<FormState>();
  final paymentFormKey = GlobalKey<FormState>();
  final billNumberController = TextEditingController();
  final amountController = TextEditingController();

  Stream billDataStream;

  String email = "water.board@gmail.com";
  String contactNumber = "0112123132";
  bool hasData = false;
  bool isButtonClicked = false;
  String error = '';

  void initialise() {
    billNumberController.text = "";
  }

  onClickProceed() async {
    isButtonClicked = true;
    notifyListeners();
  }

  getDataStream() {
    billDataStream =
        databaseService.getBillDetails("waterBills", billNumberController.text);
    return billDataStream;
  }

  onClickPay() {
    if (paymentFormKey.currentState.validate()) {
      if (amountController.text.isNumericOnly) {
        Get.to(
            PaymentInfoScreenView(isPay: true, amount: amountController.text));
      } else {
        CustomSnackBar().failed(msg: "Invalid Amount");
      }
    }
  }
}
