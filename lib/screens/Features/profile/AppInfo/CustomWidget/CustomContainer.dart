import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomIconButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

class CustomContainer extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  String title, name;
  IconData icon;
  final VoidCallback callback;

  CustomContainer({
    @required this.title,
    @required this.name,
    this.icon,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.blue[800]),
                    ),
                    CustomText(
                      text: name,
                      color: Colors.blue[600],
                    ),
                  ],
                ),
                (icon != null)
                    ? CustomIconButton(
                        icon: icon,
                        callback: () {
                          callback();
                        },
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: blockHeight * 2),
            child: Divider(
              thickness: blockHeight * 0.2,
              height: blockHeight * 2,
              color: Colors.blue[600],
            ),
          ),
        ],
      ),
    );
  }
}
