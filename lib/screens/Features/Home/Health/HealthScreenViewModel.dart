import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../Services/AuthService.dart';
import '../../../../Services/databaseService.dart';
import '../../../CustomWidgets/CustomExpandedCard/CustomExpandedCardView.dart';

class HealthScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  final DatabaseService databaseService = DatabaseService();

  Stream healthDataStream;

  getDataStream() {
    healthDataStream = databaseService.getHealthList();
    return healthDataStream;
  }

  loadHospitals(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map((doc) => CustomExpandedCard(
              title: doc["hospital"],
              subTitle: doc["location"],
              email: doc["email"],
              contactNumber: doc["contactNumber"],
              facebook: doc["facebookURL"],
              web: doc["webURL"],
            ))
        .toList();
  }
}
