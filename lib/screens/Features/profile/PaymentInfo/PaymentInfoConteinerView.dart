import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomProfileTabContainer.dart';
import 'package:wave_mobile_app/screens/Features/profile/PaymentInfo/PaymentInformation/PaymentInfo.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PaymentInfoContainer extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
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
                Get.to(PaymentInfoViewScreen());
              },
            ),
            Divider(
              height: blockHeight,
            ),
            CustomProfileTabContainer(
              title: "Payment Details",
              callback: () {},
            ),
          ],
        ),
      ),
    );
  }
}
