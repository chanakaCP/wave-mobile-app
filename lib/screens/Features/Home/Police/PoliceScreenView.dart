import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomCardItem.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Police/PoliceScreenViewModel.dart';

// ignore: must_be_immutable
class PoliceScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PoliceScreenViewModel>.reactive(
      viewModelBuilder: () => PoliceScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Police",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: blockHeight * 2),
                  alignment: Alignment.center,
                  child: Wrap(
                    children: model.topics
                        .map((topic) => CustomCardItem(
                              title: topic.title,
                              imageURL: topic.imageURL,
                              callback: () {
                                print(topic.idetifier + "  Clicked");
                              },
                            ))
                        .toList(),
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
