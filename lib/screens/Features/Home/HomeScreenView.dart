import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomCardItem.dart';
import 'package:wave_mobile_app/screens/Features/Home/HomeScreenViewModel.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  double blockHeight = SizeConfig.safeBlockVertical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (_, model, child) {
        return SingleChildScrollView(
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
                          Get.to(topic.callback);
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
