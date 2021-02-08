import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomRawInputField.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';
import 'ChangePasswordViewModel.dart';

// ignore: must_be_immutable
class ChangePasswordView extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
      viewModelBuilder: () => ChangePasswordViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "change password",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: blockHeight * 12.5,
                    left: blockWidth * 5,
                    right: blockWidth * 5,
                  ),
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: blockHeight * 2,
                            horizontal: blockWidth * 5,
                          ),
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
                            children: [
                              CustomRawInputField(
                                labeText: "Old Password",
                                isPass: true,
                                fieldController: model.oldPassController,
                              ),
                              SizedBox(height: blockHeight * 2.5),
                              CustomRawInputField(
                                labeText: "New Password",
                                isPass: true,
                                fieldController: model.passController,
                              ),
                              SizedBox(height: blockHeight * 2.5),
                              CustomRawInputField(
                                labeText: "Confirm new Password",
                                isPass: true,
                                fieldController: model.confirmPassController,
                              ),
                              SizedBox(height: blockHeight * 2.5),
                            ],
                          ),
                        ),
                        SizedBox(height: blockHeight * 2.5),
                        CustomButton(
                          title: "Change Password",
                          bgColor: Colors.blue[800],
                          textColor: Colors.white,
                          callback: () {
                            model.onClickChangePassword();
                          },
                        ),
                        SizedBox(height: blockHeight * 1.5),
                        (model.isError == true)
                            ? CustomText(
                                text: model.error,
                                color: Colors.red,
                                size: blockWidth * 4,
                              )
                            : Container(),
                        (model.isSuccess == true)
                            ? CustomText(
                                text: "Successfully changed password",
                                color: Colors.green,
                                size: blockWidth * 4,
                              )
                            : Container(),
                        SizedBox(height: blockHeight * 3.5),
                        (model.isLoading == false)
                            ? Container()
                            : CustomLoading(),
                      ],
                    ),
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
