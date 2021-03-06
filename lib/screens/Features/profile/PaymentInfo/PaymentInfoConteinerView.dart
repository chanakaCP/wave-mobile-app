import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomProfileTabContainer.dart';
import 'package:get/get.dart';

import 'cardDetails/PaymentInfoScreenView.dart';
import 'paymentsDetails/paymentHistory.dart';

// ignore: must_be_immutable
class PaymentInfoContainer extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: blockHeight),
        child: Column(
          children: [
            CustomProfileTabContainer(
              title: "My Business Card",
              callback: () {
                Get.to(PaymentInfoScreenView(
                  isPay: false,
                ));
              },
            ),
            Divider(
              height: blockHeight,
              color: Colors.blue[800],
            ),
            CustomProfileTabContainer(
              title: "Payment Details",
              callback: () {
                Get.to(PaymentHistory());
              },
            ),
          ],
        ),
      ),
    );
  }
}
