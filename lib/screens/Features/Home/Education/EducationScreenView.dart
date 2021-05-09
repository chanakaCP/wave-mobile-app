import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomCardItem.dart';
import '../../../CustomWidgets/CustomPageView.dart';
import 'EducationScreenViewModel.dart';

// ignore: must_be_immutable
class EducationScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EducationScreenViewModel>.reactive(
      viewModelBuilder: () => EducationScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Educations",
              callbackHead: () {
                Get.back();
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
                                Get.to(topic.callback);
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
