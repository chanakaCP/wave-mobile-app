import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomNotificationCard.dart';
import 'MyCardDetailsViewModel.dart';

// ignore: must_be_immutable
class MyCardDetailsView extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCardDetailsViewModel>.reactive(
      viewModelBuilder: () => MyCardDetailsViewModel(),
      builder: (_, model, child) {
        return Container(
          padding: EdgeInsets.only(top: blockHeight * 3),
          child: StreamBuilder<DocumentSnapshot>(
            stream: model.getDataStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomLoading();
              } else {
                if (!snapshot.data.data()["cardInfo"].isEmpty) {
                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: model.loadCards(snapshot, context),
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
        );
      },
    );
  }
}
