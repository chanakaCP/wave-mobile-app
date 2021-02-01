import 'package:flutter/material.dart';

import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomText.dart';

class AppInfo extends StatelessWidget {
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
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "Contact Us",
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