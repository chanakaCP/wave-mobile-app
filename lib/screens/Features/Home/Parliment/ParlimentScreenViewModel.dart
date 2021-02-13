import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomParlimentExpandedCard/CustomExpandedCardWithImageView.dart';
import '../../../../Services/AuthService.dart';
import '../../../../Services/databaseService.dart';

class ParlimentScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  final DatabaseService databaseService = DatabaseService();

  Stream ministorDataStream;

  getDataStream() {
    ministorDataStream = databaseService.getParlimentList();
    return ministorDataStream;
  }

  loadMinistors(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map((doc) => CustomExpandedCardWithImage(
              title: doc["name"],
              subTitle: doc["position"],
              imageURL: doc["imageURL"],
              email: doc["email"],
              contactNumber: doc["contactNumber"],
              facebook: doc["facebookURL"],
              web: doc["webURL"],
            ))
        .toList();
  }
}
