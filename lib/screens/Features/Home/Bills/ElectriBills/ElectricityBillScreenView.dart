import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../../../Shared/SizeConfig.dart';
import '../../../../CustomWidgets/CustomButton.dart';
import '../../../../CustomWidgets/CustomContactRow.dart';
import '../../../../CustomWidgets/CustomLoading.dart';
import '../../../../CustomWidgets/CustomPageView.dart';
import '../../../../CustomWidgets/CustomRawInputField.dart';
import '../../../../CustomWidgets/CustomRichText.dart';
import '../../../../CustomWidgets/CustomText.dart';
import 'ElectricityBillScreenViewModel.dart';

// ignore: must_be_immutable
class ElectricityBillScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ElectricityBillScreenViewModel>.reactive(
      viewModelBuilder: () => ElectricityBillScreenViewModel(),
      onModelReady: (model) => {model.initialise()},
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Electricity Bill",
              callbackHead: () {
                Get.back();
              },
              childWidget: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomContactRow(
                      email: model.email,
                      contactNumber: model.contactNumber,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: blockHeight * 5,
                        left: blockWidth * 5,
                        right: blockWidth * 5,
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: model.formKey,
                            child: Container(
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
                                    labeText: "Bill Number",
                                    isPass: false,
                                    fieldController: model.billNumberController,
                                    inputType: TextInputType.number,
                                  ),
                                  SizedBox(height: blockHeight * 2.5),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: blockHeight * 2.5),
                          CustomButton(
                            title: "Check",
                            bgColor: Colors.blue[800],
                            textColor: Colors.white,
                            callback: () {
                              model.onClickProceed();
                            },
                          ),
                          SizedBox(height: blockHeight * 2.5),
                        ],
                      ),
                    ),
                    (model.isButtonClicked == true)
                        ? Container(
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: model.getDataStream(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CustomLoading();
                                } else {
                                  if (snapshot.hasData &&
                                      snapshot.data.exists) {
                                    return Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(
                                        left: blockWidth * 5,
                                        right: blockWidth * 5,
                                      ),
                                      child: Column(
                                        children: [
                                          Form(
                                            key: model.paymentFormKey,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: blockHeight * 2,
                                                horizontal: blockWidth * 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 30,
                                                    spreadRadius: 2,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomRichText(
                                                    title: "Account Name  :  ",
                                                    data: snapshot
                                                        .data["billName"],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          blockHeight * 0.5),
                                                  CustomRichText(
                                                    title: "Bill Number  :  ",
                                                    data: snapshot
                                                        .data["billNumber"],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          blockHeight * 0.5),
                                                  CustomRichText(
                                                    title: "Bill Amount  :  ",
                                                    data: snapshot
                                                        .data["amount"]
                                                        .toString(),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          blockHeight * 0.5),
                                                  CustomRichText(
                                                    title: "Units  :  ",
                                                    data: snapshot.data["units"]
                                                        .toString(),
                                                  ),
                                                  SizedBox(height: blockHeight),
                                                  CustomRawInputField(
                                                    labeText: "Paying Amount",
                                                    isPass: false,
                                                    fieldController:
                                                        model.amountController,
                                                    inputType:
                                                        TextInputType.number,
                                                  ),
                                                  SizedBox(
                                                    height: blockHeight * 2.5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: blockHeight * 2.5),
                                          CustomButton(
                                            title: "Pay",
                                            bgColor: Colors.blue[800],
                                            textColor: Colors.white,
                                            callback: () {
                                              model.onClickPay();
                                            },
                                          ),
                                          SizedBox(height: blockHeight * 2.5),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return CustomText(
                                      text: "Invalid bill number",
                                      color: Colors.red,
                                      size: blockWidth * 4,
                                    );
                                  }
                                }
                              },
                            ),
                          )
                        : Container(),
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
