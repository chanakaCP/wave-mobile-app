import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'MyCardDetails/MyCardDetailesView.dart';

class PaymentInfoViewScreen extends StatefulWidget {
  @override
  _PaymentTabViewScreenState createState() => _PaymentTabViewScreenState();
}

class _PaymentTabViewScreenState extends State<PaymentInfoViewScreen>
    with SingleTickerProviderStateMixin {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomPageView(
          callbackHead: () {
            Get.back();
          },
          callbackTail: () async {
            await authService.signOut();
          },
          title: "My cards",
          childWidget: SingleChildScrollView(
            child: Container(
              height: blockHeight * 88,
              child: MyCardDetailsView(),
            ),
          ),
        ),
      ),
    );
  }
}
