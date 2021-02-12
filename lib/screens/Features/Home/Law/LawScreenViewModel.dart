import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../Services/AuthService.dart';
import '../../../../Services/databaseService.dart';
import '../../../CustomWidgets/CustomParlimentExpandedCard/CustomExpandedCardView.dart';

class LawScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  final DatabaseService databaseService = DatabaseService();

  Stream ministorDataStream;

  getDataStream() {
    ministorDataStream = databaseService.getLawyerstList();
    return ministorDataStream;
  }

  loadMinistors(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map((doc) => CustomParlimentExpandedCard(
              title: doc["name"],
              subTitle: doc["position"],
              imageURL: "assets/logo/tv_sirasa.jpg",
              email: doc["email"],
              contactNumber: doc["contactNumber"],
              facebook: doc["facebookURL"],
              web: doc["webURL"],
            ))
        .toList();
  }
}
