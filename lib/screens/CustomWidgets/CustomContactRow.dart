import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomIconButton.dart';

// ignore: must_be_immutable
class CustomContactRow extends StatelessWidget {
  String email, contactNumber;
  CustomContactRow({@required this.email, @required this.contactNumber});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              print(email);
            },
          ),
          SizedBox(width: blockWidth * 5),
          CustomIconButton(
            icon: Icons.call,
            callback: () {
              print(contactNumber);
            },
          ),
        ],
      ),
    );
  }
}
