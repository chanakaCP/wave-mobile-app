import 'package:awesome_card/awesome_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/models/CardDetails.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomAlertDialog.dart';

class MyCardDetailsViewModel extends ChangeNotifier {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  final DatabaseService databaseService = DatabaseService();
  Stream cardStream;
  List<dynamic> cardList = List();
  CardDetails card;

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
          (doc) => InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: blockHeight * 1.5),
              child: CreditCard(
                height: blockHeight * 25,
                cardNumber: doc["cardNumber"],
                cardExpiry: doc["validate"],
                cardHolderName: doc["name"],
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
              ),
            ),
            onLongPress: () {
              card = new CardDetails();
              card.cardNumber = doc["cardNumber"];
              card.cvv = doc["cvv"];
              card.name = doc["name"];
              card.validate = doc["validate"];
              // print(doc["cardNumber"]);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    title: "Warning !",
                    description: "Are you sure you want to delete this card ?",
                    callbackYes: () {
                      databaseService.delCardDetails(card);
                      Get.back();
                    },
                    callbackNo: () {
                      Get.back();
                    },
                  );
                },
              );
            },
          ),
        )
        .toList();
  }
}
