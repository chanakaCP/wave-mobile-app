import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  String contactNumber = "0112342349";
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
      notifyListeners();
    }
  }
}
