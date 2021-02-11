import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/Features/profile/AppInfo/AppInfoContainerView.dart';
import 'ProfileScreenViewModel.dart';
import 'PaymentInfo/PaymentInfoConteinerView.dart';
import 'PersonalInformation/PersonalInfoContainerView.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
      viewModelBuilder: () => ProfileScreenViewModel(),
      builder: (_, model, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: blockWidth * 1.5, vertical: blockHeight * 5),
          child: Column(
            children: [
              SizedBox(height: blockHeight * 10),
              PersonalInfoContainer(),
              SizedBox(height: blockHeight * 2),
              PaymentInfoContainer(),
              SizedBox(height: blockHeight * 2),
              AppInfoContainer()
            ],
          ),
        );
      },
    );
  }
}
