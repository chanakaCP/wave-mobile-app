import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../Services/AuthService.dart';
import '../../../../../Services/databaseService.dart';
import '../../../../CustomWidgets/CustomBillCard.dart';
import 'InsuranceBillScreenView.dart';

class InsuranceCompanyListScreenModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();
  Stream insuranceDataStream;

  getDataStream() {
    insuranceDataStream = databaseService.getInsuranceDetails();
    return insuranceDataStream;
  }

  loadCompanies(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map(
          (doc) => CustomBillCard(
            title: doc["name"],
            imageURL: "assets/ServiceProviders/mobitel.png",
            callback: () {
              Get.to(InsuranceBillScreen(companyName: doc["name"],));
            },
          ),
        )
        .toList();
  }
}