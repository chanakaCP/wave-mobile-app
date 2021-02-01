import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Shared/SizeConfig.dart';
import '../../CustomWidgets/CustomText.dart';
import 'ProfileViewModel.dart';
import 'core/AppInfo.dart';
import 'core/PaymentInfo.dart';
import 'core/PersonalInfo.dart';

class ProfileView extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (_, model, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: blockHeight),
              PersonalInfo(),
              SizedBox(height: blockHeight),
              PaymentInfo(),
              SizedBox(height: blockHeight),
              AppInfo()
            ],
          ),
        );
      },
    );
  }
}
