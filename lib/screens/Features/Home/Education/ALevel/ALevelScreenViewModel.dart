import 'package:flutter/material.dart';
import 'package:wave_mobile_app/models/SubjectResult.dart';

import '../../../../../Services/AuthService.dart';
import '../../../../../Services/databaseService.dart';

class ALevelScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  final formKey = GlobalKey<FormState>();
  final indexNumberController = TextEditingController();
  final yearController = TextEditingController();

  Stream aLDataStream;
  SubjectResult subjectResult = new SubjectResult();

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
    aLDataStream = databaseService.getCertificate(
        "AL-certificate", indexNumberController.text, yearController.text);
    return aLDataStream;
  }

  onClickPay() {
    notifyListeners();
  }
}
