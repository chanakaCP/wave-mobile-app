import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/screens/Features/profile/PaymentInformation/PaymentInfo.dart';

import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class PaymentInfo extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: blockHeight * 1, horizontal: blockWidth * 1),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: blockWidth * 7.5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: "Card Handling",
                            color: Colors.black,
                            size: blockHeight * 2,
                            weight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(bottom: blockHeight),
                          color: Colors.black,
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: blockHeight * 3,
                          ),
                          onPressed: () {
                            Get.to(PaymentTabViewScreen());
                          },
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(PaymentTabViewScreen());
                  },
                ),
                Divider(
                  height: blockHeight,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 7.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "Payment Details",
                          color: Colors.black,
                          size: blockHeight * 2,
                          weight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(bottom: blockHeight),
                        color: Colors.black,
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          size: blockHeight * 3,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
