import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/Topic.dart';

class BillScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  List<dynamic> topics = [
    Topic(
      title: "Electricity Bill",
      imageURL: "assets/icons/bills/electricity.png",
      idetifier: "electricity",
    ),
    Topic(
      title: "Water Bill",
      imageURL: "assets/icons/bills/waterBill.png",
      idetifier: "water",
    ),
    Topic(
      title: "Telephone Bill",
      imageURL: "assets/icons/bills/telephone.png",
      idetifier: "phone",
    ),
    Topic(
      title: "Tax",
      imageURL: "assets/icons/bills/tax.png",
      idetifier: "tax",
    ),
    Topic(
      title: "Insurance",
      imageURL: "assets/icons/bills/insurance.png",
      idetifier: "insurance",
    )
  ];
}
