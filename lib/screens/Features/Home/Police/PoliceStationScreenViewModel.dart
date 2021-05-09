import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/screens/Features/profile/PaymentInfo/cardDetails/PaymentInfoScreenView.dart';

class PoliceStationScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  final formKey = GlobalKey<FormState>();
  final billNumberController = TextEditingController();

  Stream billDataStream;
  String email, contactNumber, stationName;
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
        databaseService.getFineDetails(stationName, billNumberController.text);
    return billDataStream;
  }

  onClickPay(String fine) {
    Get.to(PaymentInfoScreenView(isPay: true, amount: fine));
  }
}
