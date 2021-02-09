import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';

// ignore: must_be_immutable
class CustomRichText extends StatelessWidget {
  String title, data;
  CustomRichText({@required this.title, @required this.data});

  double blockWidth = SizeConfig.safeBlockHorizontal;

  textStyleBold() {
    return TextStyle(
      color: Colors.blue[800],
      fontSize: blockWidth * 5,
      fontWeight: FontWeight.w500,
    );
  }

  textStyleNormal() {
    return TextStyle(
      color: Colors.blue[600],
      fontSize: blockWidth * 5,
      fontWeight: FontWeight.w400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: textStyleBold(),
          ),
          TextSpan(
            text: data,
            style: textStyleNormal(),
          ),
        ],
      ),
    );
  }
}
