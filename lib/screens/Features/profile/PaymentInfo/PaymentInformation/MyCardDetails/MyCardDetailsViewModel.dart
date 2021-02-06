import 'package:awesome_card/awesome_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../Services/databaseService.dart';
import '../../../../../../Shared/SizeConfig.dart';

class MyCardDetailsViewModel extends ChangeNotifier {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  final DatabaseService databaseService = DatabaseService();
  Stream cardStream;
  List<dynamic> cardList = List();

  getDataStream() {
    cardStream = databaseService.getCards();
    return cardStream;
  }

  loadCards(AsyncSnapshot<DocumentSnapshot> snapshot, BuildContext context) {
    if (snapshot.hasData && snapshot.data.exists) {
      cardList = snapshot.data["cardInfo"];
    }
    return cardList
        .map(
          (doc) => Container(
            padding: EdgeInsets.symmetric(vertical: blockHeight ),
            child: CreditCard(
              height: blockHeight * 24,
              cardNumber: doc["cardNumber"],
              cardExpiry: doc["validate"],
              cardHolderName: doc["name"],
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              // showShadow: true,
            ),
          ),
        )
        .toList();
  }
}
