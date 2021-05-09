import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomCardItem.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Media/MediaScreenViewModel.dart';

// ignore: must_be_immutable
class MediaScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MediaScreenViewModel>.reactive(
      viewModelBuilder: () => MediaScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Media",
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
