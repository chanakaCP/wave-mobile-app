import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/models/Payment.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPaymentHistoryCard.dart';

// ignore: camel_case_types
class paymentHistoryModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();
  List<dynamic> paymentList = List();
  Stream paymenStream;
  Payment paymentDetails;

  getDataStream() {
    paymenStream = databaseService.getPaymentHistory();
    return paymenStream;
  }

  loadHistory(AsyncSnapshot<DocumentSnapshot> snapshot, BuildContext context) {
    if (snapshot.hasData && snapshot.data.exists) {
      paymentList = snapshot.data["Details"];
    }

    return paymentList
        .map((doc) => CustomPaymentHistoryCard(new Payment(
              id: doc["ID"],
              amount: doc["amount"],
              billNo: doc["billNo"],
              type: doc["type"],
              date: doc["date"],
            )))
        .toList();
  }
}
