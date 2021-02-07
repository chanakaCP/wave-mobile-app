import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/Insurance%20Bills/InsuranceBillScreenViewModel.dart';

class InsuranceBillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InsuranceBillScreenViewModel>.reactive(
      viewModelBuilder: () => InsuranceBillScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Insurance Bills",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  child: Text("Insurance bill"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
