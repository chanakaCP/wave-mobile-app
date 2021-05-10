import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/models/Payment.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/snackbar/CustomSuccessSnackBar.dart';
import 'package:wave_mobile_app/screens/Features/profile/PaymentInfo/cardDetails/PaymentInfoScreenView.dart';

class InsuranceBillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();
  String companyName, contactNumber, email;

  final formKey = GlobalKey<FormState>();
  final paymentFormKey = GlobalKey<FormState>();
  final billNumberController = TextEditingController();
  final amountController = TextEditingController();

  Stream billDataStream;

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
    billDataStream = databaseService.getInsuranceBillDetails(
        companyName, billNumberController.text);
    return billDataStream;
  }

  onClickPay() {
    if (paymentFormKey.currentState.validate()) {
      if (amountController.text.isNumericOnly) {
        Payment payment = Payment();
        payment.amount = amountController.text;
        payment.billNo = billNumberController.text;
        payment.id = "1234";
        payment.type = "Electricity Bill";
        payment.status = "pending";

        Get.to(PaymentInfoScreenView(
          isPay: true,
          payment: payment,
        ));
      } else {
        CustomSnackBar().failed(msg: "Invalid Amount");
      }
    }
  }
}
