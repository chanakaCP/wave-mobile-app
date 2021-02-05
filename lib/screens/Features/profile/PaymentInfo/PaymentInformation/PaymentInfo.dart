import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'MyCardDetails/MyCardDetailesView.dart';

class PaymentTabViewScreen extends StatefulWidget {
  @override
  _PaymentTabViewScreenState createState() => _PaymentTabViewScreenState();
}

class _PaymentTabViewScreenState extends State<PaymentTabViewScreen>
    with SingleTickerProviderStateMixin {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return CustomPageView(
      callbackHead: () {
        Get.back();
      },
      callbackTail: () async {
        await authService.signOut();
      },
      childWidget: SingleChildScrollView(
        child: Container(
          height: blockHeight * 88,
          child: MyCardDetailsView(),
        ),
      ),
    );
  }
}