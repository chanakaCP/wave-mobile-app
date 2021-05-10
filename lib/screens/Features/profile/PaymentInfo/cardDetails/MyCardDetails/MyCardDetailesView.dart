import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/models/Payment.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
import 'MyCardDetailsViewModel.dart';

// ignore: must_be_immutable
class MyCardDetailsView extends StatelessWidget {
  MyCardDetailsView({@required this.isPay, this.payment});
  bool isPay;
  Payment payment;
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCardDetailsViewModel>.reactive(
      viewModelBuilder: () => MyCardDetailsViewModel(),
      onModelReady: (model) => model.initialise(payment),
      builder: (_, model, child) {
        return Container(
          padding: EdgeInsets.only(top: blockHeight * 3),
          child: StreamBuilder<DocumentSnapshot>(
            stream: model.getDataStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomLoading();
              } else {
                if (!snapshot.data.data()["cardInfo"].isEmpty) {
                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: model.loadCards(
                      snapshot: snapshot,
                      context: context,
                      isPay: isPay,
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "No saved cards... \n click Add Card button to save your card",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                  );
                }
              }
            },
          ),
        );
      },
    );
  }
}
