import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/screens/Features/profile/PersonalInformation/ChangePassword/ChangePasswordView.dart';

import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class PersonalInfo extends StatelessWidget {
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
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 7.5,
                    vertical: blockHeight * 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: blockHeight * 5,
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
                Divider(
                  height: blockHeight,
                ),
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
                            text: "Change Password",
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
                            Get.to(ChangePasswordView());
                          },
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(ChangePasswordView());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
