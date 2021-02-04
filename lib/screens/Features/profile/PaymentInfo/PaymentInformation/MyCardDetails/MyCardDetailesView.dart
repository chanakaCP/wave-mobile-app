import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../Shared/SizeConfig.dart';
import '../../../../../CustomWidgets/CustomLoading.dart';
import '../../../../../CustomWidgets/CustomNotificationCard.dart';
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
          // padding: EdgeInsets.only(top: blockHeight ),
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
