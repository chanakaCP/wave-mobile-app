import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';

// ignore: must_be_immutable
class CustomLoading extends StatelessWidget {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: blockHeight * 5),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        strokeWidth: 5,
      ),
    );
  }
}
