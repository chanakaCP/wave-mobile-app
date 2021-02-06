import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Health/HealthScreenViewModel.dart';

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HealthScreenViewModel>.reactive(
      viewModelBuilder: () => HealthScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Health",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  child: Text("health screen"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
