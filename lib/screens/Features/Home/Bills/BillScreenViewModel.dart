import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/Topic.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/ElectriBills/ElectricityBillScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/TaxBills/TaxBillScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/TelephoneBill/PhoneCategoryListScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/WaterBIll/WaterBillScreenView.dart';

import 'InsuranceBills/InsuranceCompanyListScreenView.dart';

class BillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  List<dynamic> topics = [
    Topic(
      title: "Electricity Bill",
      imageURL: "assets/icons/bills/electricity.png",
      idetifier: "electricity",
      callback: ElectricityBillScreen(),
    ),
    Topic(
      title: "Water Bill",
      imageURL: "assets/icons/bills/waterBill.png",
      idetifier: "water",
      callback: WaterBillScreen(),
    ),
    Topic(
      title: "Telephone Bill",
      imageURL: "assets/icons/bills/telephone.png",
      idetifier: "phone",
      callback: PhoneCategoryListScreen(),
    ),
    Topic(
      title: "Tax",
      imageURL: "assets/icons/bills/tax.png",
      idetifier: "tax",
      callback: TaxBillScreen(),
    ),
    Topic(
      title: "Insurance",
      imageURL: "assets/icons/bills/insurance.png",
      idetifier: "insurance",
      callback: InsuranceCompanyListScreen(),
    )
  ];
}
