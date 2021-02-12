import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomExpandedCard/CustomExpandedCardView.dart';

class TVListScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  Stream tvDataStream;

  getDataStream() {
    tvDataStream = databaseService.getMediaList("tvChannels");
    return tvDataStream;
  }

  loadCompanies(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map((doc) => CustomExpandedCard(
              title: doc["channel"],
              tailingText: doc["rating"].toString(),
              imageURL: doc["imageURL"],
              email: doc["email"],
              contactNumber: doc["contactNumber"],
              facebook: doc["facebookURL"],
              web: doc["webURL"],
            ))
        .toList();
  }
}
