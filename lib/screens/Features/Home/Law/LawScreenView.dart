import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomLoading.dart';
import '../../../CustomWidgets/CustomNotificationCard.dart';
import '../../../CustomWidgets/CustomPageView.dart';
import 'LawScreenViewModel.dart';

// ignore: must_be_immutable
class LawScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LawScreenViewModel>.reactive(
      viewModelBuilder: () => LawScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Law and Justies",
              callbackHead: () {
                Get.back();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  height: blockHeight * 87.5,
                  alignment: Alignment.center,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: model.getDataStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CustomLoading();
                      } else {
                        if (snapshot.hasData && snapshot.data.size != 0) {
                          return Container(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: model.loadMinistors(snapshot, context),
                            ),
                          );
                        } else {
                          return CustomNotificationCard(
                            title:
                                "Something went wrong.. Plese restart the app after few minutes",
                          );
                        }
                      }
                    },
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
