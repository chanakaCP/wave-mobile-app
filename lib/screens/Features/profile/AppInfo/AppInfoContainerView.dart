import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomProfileTabContainer.dart';

import 'ContactUs/AppInfoView.dart';

// ignore: must_be_immutable
class AppInfoContainer extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
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
            CustomProfileTabContainer(title: "Contact Us", callback: () {
              Get.to(AppInfoView());
            }),
          ],
        ),
      ),
    );
  }
}
