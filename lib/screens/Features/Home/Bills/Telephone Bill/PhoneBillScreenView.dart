import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomRawInputField.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/Telephone%20Bill/PhoneBillScreenViewModel.dart';

// ignore: must_be_immutable
class PhoneBillScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneBillScreenViewModel>.reactive(
      viewModelBuilder: () => PhoneBillScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Telephone Bills",
              callbackHead: () {
                Get.back();
              },
              callbackTail: () async {
                await model.authService.signOut();
              },
              childWidget: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: blockHeight * 15,
                    horizontal: blockWidth * 5,
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
                                labeText: "Mobile Number",
                                isPass: false,
                                fieldController: model.mobileController,
                                inputType: TextInputType.number,
                              ),
                              SizedBox(height: blockHeight * 2.5),
                              CustomRawInputField(
                                labeText: "Confirm Mobile Number",
                                isPass: false,
                                fieldController: model.confirmMobileController,
                                inputType: TextInputType.number,
                              ),
                              SizedBox(height: blockHeight * 2.5),
                              CustomRawInputField(
                                labeText: "Amount",
                                isPass: false,
                                fieldController: model.amountController,
                                inputType: TextInputType.number,
                              ),
                              SizedBox(height: blockHeight * 2.5),
                              CustomRawInputField(
                                labeText: "Confirm Amount",
                                isPass: false,
                                fieldController: model.confirmAmountController,
                                inputType: TextInputType.number,
                              ),
                              SizedBox(height: blockHeight * 2.5),
                            ],
                          ),
                        ),
                        SizedBox(height: blockHeight * 2.5),
                        CustomButton(
                          title: "Proceed",
                          bgColor: Colors.blue[800],
                          textColor: Colors.white,
                          callback: () {
                            model.onClickProceed();
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
                                text: "Successfully Message",
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
