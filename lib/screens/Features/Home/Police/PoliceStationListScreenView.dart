import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Police/PoliceStationListScreenViewModel.dart';

// ignore: must_be_immutable
class PoliceStationListScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PoliceStationListScreenView>.reactive(
      viewModelBuilder: () => PoliceStationListScreenView(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Police Stations",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  height: blockHeight * 87.5,
                  alignment: Alignment.center,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    // children: model.loadCard(),
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
