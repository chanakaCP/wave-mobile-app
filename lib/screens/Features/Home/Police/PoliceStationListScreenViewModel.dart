import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomBillCard.dart';
import 'package:wave_mobile_app/screens/Features/Home/Police/PoliceStationScreenView.dart';

class PoliceStationListScreenView extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();
  Stream insuranceDataStream;

  getDataStream() {
    insuranceDataStream = databaseService.getStationList();
    return insuranceDataStream;
  }

  loadCompanies(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map(
          (doc) => CustomBillCard(
            title: doc["station"],
            callback: () {
              Get.to(PoliceStationScreen(
                stationName: doc["station"],
                contact: doc["contactNumber"],
                email: doc["email"],
              ));
            },
          ),
        )
        .toList();
  }
}
