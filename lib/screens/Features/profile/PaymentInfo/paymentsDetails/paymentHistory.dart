import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';

import 'paymentHistoryModel.dart';

// ignore: camel_case_types
class paymentHistory extends StatelessWidget {
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
                  child: Text("payment history"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
