import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/databaseUpdateService.dart';
import 'package:wave_mobile_app/Services/paymentService.dart';
import 'package:wave_mobile_app/models/Payment.dart';
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
  final DatabaseUPdateService databaseUpdateService = DatabaseUPdateService();
  Stream cardStream;
  List<dynamic> cardList = List();

  // String amount;
  Payment payment;
  bool payAccess;
  getDataStream() {
    cardStream = databaseService.getCards();
    return cardStream;
  }

  initialise(Payment paymentData) {
    this.payment = paymentData;
    this.payAccess = false;
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
      amount: payment.amount,
      currency: "INR",
      card: creditCard,
    );

    if (response.isSuccess == true) {
      await CustomSnackBar().successWithCallback(
        context: context,
        icon: Icons.check,
        message: response.message,
        callback: FirstView(),
      );
      payment.status = "success";
    } else {
      await CustomSnackBar().failedWithCallback(
        context: context,
        icon: Icons.close,
        message: response.message,
      );
      payment.status = "failed";
    }
    payment.date = DateTime.now();
    databaseUpdateService.addPaymentDetails(payment);
  }

  loadCards(
      {AsyncSnapshot<DocumentSnapshot> snapshot,
      BuildContext context,
      bool isPay}) {
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
                CardDetails card = new CardDetails();
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomAlertDialog(
                        title: "Payment Alert!",
                        description:
                            "Please confirm the payment \nRs : ${payment.amount}",
                        callbackNo: () {
                          payAccess = false;
                          Get.back();
                        },
                        callbackYes: () {
                          payAccess = true;
                          Get.back();
                        },
                      );
                    },
                  );
                  if (payAccess == true) {
                    CardDetails card = CardDetails();
                    card.cardNumber = doc["cardNumber"];
                    card.cvv = doc["cvv"];
                    card.name = doc["name"];
                    card.validate = doc["validate"];

                    onTapCard(context, card);
                  }
                }
              },
            ),
          )
          .toList();
    }
  }
}
