import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomFormField.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
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
            appBar: AppBar(
              actions: [
                RaisedButton(
                  onPressed: () async {
                    await model.authService.signOut();
                  },
                  child: Text("LOGOUT"),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: blockHeight * 7.5,
                  horizontal: blockWidth * 10,
                ),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        hintText: "old password",
                        isPass: true,
                        fieldController: model.oldPassController,
                        prefixIcon: Icons.lock,
                      ),
                      SizedBox(height: blockHeight * 2.5),
                      CustomFormField(
                        hintText: "new password",
                        isPass: true,
                        fieldController: model.passController,
                        prefixIcon: Icons.lock,
                      ),
                      SizedBox(height: blockHeight * 2.5),
                      CustomFormField(
                        hintText: "confirm new password",
                        isPass: true,
                        fieldController: model.confirmPassController,
                        prefixIcon: Icons.lock,
                      ),
                      SizedBox(height: blockHeight * 2.5),
                      CustomButton(
                        width: blockWidth * 60,
                        height: blockHeight * 6,
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
        );
      },
    );
  }
}
