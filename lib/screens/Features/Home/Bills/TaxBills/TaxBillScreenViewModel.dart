import 'package:flutter/widgets.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';

class TaxBillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  final formKey = GlobalKey<FormState>();
  final paymentFormKey = GlobalKey<FormState>();
  final billNumberController = TextEditingController();
  final amountController = TextEditingController();

  Stream billDataStream;

  String email = "electricity.board@gmail.com";
  String contactNumber = "0112123123";
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
        "taxBills", billNumberController.text);
    return billDataStream;
  }

  onClickPay() {
    if (paymentFormKey.currentState.validate()) {
      notifyListeners();
    }
  }
}
