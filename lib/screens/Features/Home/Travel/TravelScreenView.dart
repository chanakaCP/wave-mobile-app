import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomButton.dart';
import '../../../CustomWidgets/CustomPageView.dart';
import '../../../CustomWidgets/CustomRawInputField.dart';
import 'TravelScreenViewModel.dart';

// ignore: must_be_immutable
class TravelScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TravelScreenViewModel>.reactive(
      viewModelBuilder: () => TravelScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: CustomPageView(
              title: "Travel",
              callbackHead: () {
                Get.back();
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
                                    labeText: "from",
                                    isPass: false,
                                    fieldController: model.fromController,
                                    inputType: TextInputType.number,
                                  ),
                                  SizedBox(height: blockHeight * 2.5),
                                  CustomRawInputField(
                                    labeText: "to",
                                    isPass: false,
                                    fieldController: model.toController,
                                    inputType: TextInputType.number,
                                  ),
                                  SizedBox(height: blockHeight * 2.5),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: blockHeight * 2.5),
                          CustomButton(
                            title: "GO",
                            bgColor: Colors.blue[800],
                            textColor: Colors.white,
                            callback: () {
                              model.onClickProceed();
                            },
                          ),
                          SizedBox(height: blockHeight * 2.5),
                          Container(
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
                            child:  Image(image: AssetImage( "assets/Map.jpg"),fit: BoxFit.contain,)
                          )
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
