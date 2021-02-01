import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomFormField.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';
import 'package:wave_mobile_app/screens/Features/Auth/SignUp/SignUpScreenViewModel.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  final VoidCallback changeBodyCallback;
  SignUpScreen({@required this.changeBodyCallback});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpScreenViewModel>.reactive(
      viewModelBuilder: () => SignUpScreenViewModel(),
      builder: (_, model, child) {
        return Container(
          child: Form(
            key: model.formKey,
            child: Column(
              children: [
                CustomFormField(
                  fillColor: Colors.deepPurple[100],
                  hintText: "Username",
                  isPass: false,
                  fieldController: model.userNameController,
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: blockHeight * 2.5),
                CustomFormField(
                    fillColor: Colors.deepPurple[100],
                    hintText: "Email",
                    isPass: false,
                    fieldController: model.emailController,
                    prefixIcon: Icons.mail),
                SizedBox(height: blockHeight * 2.5),
                CustomFormField(
                    fillColor: Colors.deepPurple[100],
                    hintText: "Phone number",
                    isPass: false,
                    fieldController: model.mobileController,
                    prefixIcon: Icons.phone),
                SizedBox(height: blockHeight * 2.5),
                CustomFormField(
                  fillColor: Colors.deepPurple[100],
                  hintText: "Password",
                  isPass: true,
                  fieldController: model.passController,
                  prefixIcon: Icons.lock,
                ),
                SizedBox(height: blockHeight * 2.5),
                CustomButton(
                  title: "Register",
                  bgColor: Colors.deepPurple[600],
                  textColor: Colors.white,
                  callback: () {
                    model.onClickSignUp();
                  },
                ),
                (model.isLoading == true) ? CustomLoading() : Container(),
                SizedBox(height: blockHeight * 1.5),
                (model.isError == true)
                    ? CustomText(
                        text: model.error,
                        color: Colors.red,
                        size: blockWidth * 4,
                      )
                    : Container(),
                SizedBox(height: blockHeight * 3.5),
                (model.isLoading == false)
                    ? Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.deepPurple[400],
                                    height: blockHeight * .25,
                                  ),
                                ),
                                SizedBox(width: blockWidth * 2),
                                CustomText(
                                  text: "Already have an account ?",
                                  color: Colors.deepPurple[400],
                                  size: blockWidth * 4,
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(width: blockWidth * 2),
                                Expanded(
                                  child: Container(
                                    color: Colors.deepPurple[400],
                                    height: blockHeight * .25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: blockHeight * 2.5),
                          CustomButton(
                            title: "Login",
                            bgColor: Colors.transparent,
                            textColor: Colors.deepPurple[600],
                            borderColor: Colors.deepPurple[600],
                            height: blockHeight * 5,
                            width: blockWidth * 30,
                            fontSize: blockWidth * 4,
                            fontWeight: FontWeight.w500,
                            callback: () {
                              changeBodyCallback();
                            },
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
