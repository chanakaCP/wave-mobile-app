import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/Features/profile/AppInfo/CustomWidget/CustomContainer.dart';
import '../../../../../Shared/SizeConfig.dart';
import '../../../../CustomWidgets/CustomPageView.dart';
import 'AppInfoViewModel.dart';

// ignore: must_be_immutable
class AppInfoView extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppInfoViewModel>.reactive(
      viewModelBuilder: () => AppInfoViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Contact Us",
              callbackHead: () {
                Get.back();
              },
              childWidget: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: blockHeight * 5,
                          horizontal: blockWidth * 5),
                      padding: EdgeInsets.only(
                          right: blockWidth * 5,
                          left: blockWidth * 5,
                          top: blockHeight * 5,
                          bottom: blockHeight),
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
                            title: "Team :",
                            name: model.team,
                          ),
                          CustomContainer(
                            title: "Address :",
                            name: model.address,
                          ),
                          CustomContainer(
                            title: "Phone :",
                            name: model.phoneNum,
                            icon: Icons.call,
                            callback: () {
                              model.makePhoneCall();
                            },
                          ),
                          CustomContainer(
                            title: "Email :",
                            name: model.email,
                            icon: Icons.alternate_email_outlined,
                            callback: () {
                              model.sendMail();
                            },
                          ),
                          CustomContainer(
                            title: "Web :",
                            name: model.webName,
                            icon: Icons.web_asset_rounded,
                            callback: () {
                              model.launchInBrowser(model.webURL);
                            },
                          ),
                          CustomContainer(
                            title: "Facebook :",
                            name: model.fbName,
                            icon: Icons.link,
                            callback: () {
                              model.launchInBrowser(model.fbURL);
                            },
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
