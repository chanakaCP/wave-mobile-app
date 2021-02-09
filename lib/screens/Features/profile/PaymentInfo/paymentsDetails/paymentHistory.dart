import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';

import 'paymentHistoryModel.dart';

// ignore: camel_case_types
class PaymentHistory extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<paymentHistoryModel>.reactive(
      viewModelBuilder: () => paymentHistoryModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Payment History",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  height: blockHeight * 86,
                  padding: EdgeInsets.only(top: blockHeight * 3),
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: model.getDataStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CustomLoading();
                      } else {
                        if (!snapshot.data.data()["Details"].isEmpty) {
                          return Container(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: model.loadHistory(snapshot, context),
                            ),
                            margin: EdgeInsets.only(
                              left: blockWidth * 5,
                              right: blockWidth * 5,
                              top: blockWidth * 3,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          );
                        } else {
                          return CustomNotificationCard(
                            title:
                                "Something went wrong.. Plese restart the app after few minutes",
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
