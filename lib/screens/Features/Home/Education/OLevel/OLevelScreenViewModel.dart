import 'package:flutter/material.dart';

import '../../../../../Services/AuthService.dart';
import '../../../../../Services/databaseService.dart';

class OLevelScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  final formKey = GlobalKey<FormState>();
  final indexNumberController = TextEditingController();
  final yearController = TextEditingController();

  Stream oLDataStream;

  String email = "educationDepartment@gmail.com";
  String contactNumber = "+94716816135";
  bool isButtonClicked = false;

  void initialise() {
    indexNumberController.text = "";
    yearController.text = "";
  }

  onClickProceed() async {
    isButtonClicked = true;
    notifyListeners();
  }

  getDataStream() {
    oLDataStream = databaseService.getCertificate("OL-certificate", indexNumberController.text, yearController.text);
    return oLDataStream;
  }

  onClickPay() {
    notifyListeners();
  }
}
