import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/paymentService.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/snackbar/CustomSuccessSnackBar.dart';
import 'package:wave_mobile_app/screens/Features/FirstView.dart';
import 'package:stripe_payment/stripe_payment.dart' as stripe;
import '../../../../../../Services/databaseService.dart';
import '../../../../../../Shared/SizeConfig.dart';
import '../../../../../../models/CardDetails.dart';
import '../../../../../CustomWidgets/CustomAlertDialog.dart';

class MyCardDetailsViewModel extends ChangeNotifier {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  final DatabaseService databaseService = DatabaseService();
  Stream cardStream;
  List<dynamic> cardList = List();
  CardDetails card;
  String amount;

  getDataStream() {
    cardStream = databaseService.getCards();
    return cardStream;
  }

  initialise(String payAmount) {
    this.amount = payAmount;
  }

  onTapCard(BuildContext context, dynamic card) async {
    var expiryArr = card.validate.split('/');

    stripe.CreditCard creditCard = stripe.CreditCard(
      name: card.name,
      number: card.cardNumber,
      expMonth: int.parse(expiryArr[0]),
      expYear: int.parse(expiryArr[1]),
    );
    var response = await StripeService.payViaExistingCard(
      amount: amount,
      currency: "INR",
      card: creditCard,
    );

    if (response.isSuccess == true) {
      CustomSnackBar().successWithCallback(
        context: context,
        icon: Icons.check,
        message: response.message,
        callback: FirstView(),
      );
    } else {
      CustomSnackBar().failedWithCallback(
        context: context,
        icon: Icons.close,
        message: response.message,
      );
    }
  }

  loadCards(AsyncSnapshot<DocumentSnapshot> snapshot, BuildContext context,
      bool isPay) {
    if (snapshot.hasData && snapshot.data.exists) {
      cardList = snapshot.data["cardInfo"];
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlertDialog(
                      title: "Warning !",
                      description:
                          "Are you sure you want to delete this card ?",
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
              onTap: () {
                if (isPay == true) {
                  card = new CardDetails();
                  card.cardNumber = doc["cardNumber"];
                  card.cvv = doc["cvv"];
                  card.name = doc["name"];
                  card.validate = doc["validate"];
                  // print(card.cardNumber);
                  onTapCard(context, card);
                }
              },
            ),
          )
          .toList();
    }
  }
}
