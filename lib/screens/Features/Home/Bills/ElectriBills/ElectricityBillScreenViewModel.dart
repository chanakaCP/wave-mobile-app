import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/models/Payment.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/snackbar/CustomSuccessSnackBar.dart';
import 'package:wave_mobile_app/screens/Features/profile/PaymentInfo/cardDetails/PaymentInfoScreenView.dart';
import '../../../../../Services/AuthService.dart';
import '../../../../../Services/databaseService.dart';

class ElectricityBillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  final formKey = GlobalKey<FormState>();
  final paymentFormKey = GlobalKey<FormState>();
  final billNumberController = TextEditingController();
  final amountController = TextEditingController();

  Stream billDataStream;

  String email = "electricity.board@gmail.com";
  String contactNumber = "0112342341";
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
    billDataStream = databaseService.getBillDetails(
        "electricityBills", billNumberController.text);
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
