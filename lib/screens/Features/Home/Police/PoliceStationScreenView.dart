import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomIconButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomLoading.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomRawInputField.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomRichText.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';
import 'package:wave_mobile_app/screens/Features/Home/Police/PoliceStationScreenViewModel.dart';

// ignore: must_be_immutable
class PoliceStationScreen extends StatelessWidget {
  String stationName, email, contact;
  PoliceStationScreen(
      {@required this.stationName,
      @required this.contact,
      @required this.email});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PoliceStationScreenViewModel>.reactive(
      viewModelBuilder: () => PoliceStationScreenViewModel(),
      onModelReady: (model) => {
        model.stationName = this.stationName,
        model.email = this.email,
        model.contactNumber = this.contact,
        model.initialise(),
      },
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: stationName,
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
                      padding: EdgeInsets.only(
                        top: blockHeight * 5,
                        left: blockWidth * 5,
                        right: blockWidth * 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomIconButton(
                            icon: Icons.alternate_email_outlined,
                            callback: () {
                              print(model.email);
                            },
                          ),
                          SizedBox(width: blockWidth * 5),
                          CustomIconButton(
                            icon: Icons.call,
                            callback: () {
                              print(model.contactNumber);
                            },
                          ),
                        ],
                      ),
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
                            title: "Proceed",
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
                                          Container(
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
                                                  title: "Fine Id  :  ",
                                                  data: snapshot.data["fineId"],
                                                ),
                                                SizedBox(
                                                    height: blockHeight * 0.5),
                                                CustomRichText(
                                                  title: "Offender  :  ",
                                                  data:
                                                      snapshot.data["offender"],
                                                ),
                                                SizedBox(
                                                    height: blockHeight * 0.5),
                                                CustomRichText(
                                                  title: "Licean Number  :  ",
                                                  data: snapshot
                                                      .data["liceanNumber"],
                                                ),
                                                SizedBox(
                                                    height: blockHeight * 0.5),
                                                CustomRichText(
                                                  title: "Vehicle Number  :  ",
                                                  data: snapshot
                                                      .data["vehicalNumber"],
                                                ),
                                                SizedBox(
                                                    height: blockHeight * 0.5),
                                                CustomRichText(
                                                  title: "Violated Rule  :  ",
                                                  data: snapshot
                                                      .data["violatedRule"],
                                                ),
                                                SizedBox(
                                                    height: blockHeight * 0.5),
                                                CustomRichText(
                                                  title: "Fine  :  ",
                                                  data: snapshot.data["fine"]
                                                      .toString(),
                                                ),
                                                SizedBox(
                                                  height: blockHeight * 2.5,
                                                ),
                                              ],
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
