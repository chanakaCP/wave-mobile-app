import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/Features/profile/AppInfo/AppInfo.dart';
import 'ProfileScreenViewModel.dart';
import 'PaymentInfo/PaymentInfo.dart';
import 'PersonalInformation/PersonalInfo.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
      viewModelBuilder: () => ProfileScreenViewModel(),
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
