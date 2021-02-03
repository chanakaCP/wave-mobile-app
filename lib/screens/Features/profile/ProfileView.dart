import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Shared/SizeConfig.dart';
import 'ProfileViewModel.dart';
import 'core/AppInfo.dart';
import 'core/PaymentInfo.dart';
import 'core/PersonalInfo.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (_, model, child) {
        return Column(
          children: [
            SizedBox(height: blockHeight * 10),
            PersonalInfo(),
            SizedBox(height: blockHeight),
            PaymentInfo(),
            SizedBox(height: blockHeight),
            AppInfo()
          ],
        );
      },
    );
  }
}
