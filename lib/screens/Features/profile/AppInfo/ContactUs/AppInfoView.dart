import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/Features/profile/AppInfo/CustomWidget/CustomContainer.dart';
import '../../../../CustomWidgets/CustomIconButton.dart';
import '../../../../CustomWidgets/CustomText.dart';
import '../../../../../Shared/SizeConfig.dart';
import '../../../../CustomWidgets/CustomPageView.dart';
import 'AppInfoViewModel.dart';

class AppInfoView extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AppInfoViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Contact Us",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: blockHeight * 5,
                          horizontal: blockWidth * 5),
                      padding: EdgeInsets.symmetric(
                          vertical: blockHeight * 5,
                          horizontal: blockWidth * 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer(
                            title: "City :",
                            name: "Thanamalwila",
                          ),
                          CustomContainer(
                            title: "Address :",
                            name: "Thanamalwila",
                          ),
                          CustomContainer(
                            title: "Phone :",
                            name: "(+94) 71 6816135",
                            icon: Icons.call,
                            callback: () {},
                          ),
                          CustomContainer(
                            title: "Email :",
                            name: "shan@xdoto.io",
                            icon: Icons.alternate_email_outlined,
                            callback: () {},
                          ),
                          CustomContainer(
                            title: "Web :",
                            name: "shan.xdoto.io",
                            icon: Icons.web_asset_rounded,
                            callback: () {},
                          ),
                          CustomContainer(
                            title: "Facebook :",
                            name: "shan Manage",
                            icon: Icons.link,
                            callback: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
