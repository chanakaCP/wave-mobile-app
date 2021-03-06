import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomExpandedCard/CustomExpandedCardView.dart';

class FMListScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  Stream fmDataStream;

  double blockHeight = SizeConfig.safeBlockVertical;

  getDataStream() {
    fmDataStream = databaseService.getMediaList("fmChannels");
    return fmDataStream;
  }

  loadChannels(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
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

// "assets/logo/fm/fm_y.jpg"
