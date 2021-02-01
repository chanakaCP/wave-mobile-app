import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  double width, height, fontSize;
  String title;
  Color bgColor, textColor, borderColor;
  final VoidCallback callback;
  FontWeight fontWeight;

  CustomButton(
      {@required this.title,
      @required this.bgColor,
      @required this.textColor,
      @required this.callback,
      this.borderColor,
      this.fontWeight,
      this.height,
      this.width,
      this.fontSize});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (height != null) ? height : blockHeight * 7,
      width: (width != null) ? width : double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: (borderColor == null) ? bgColor : borderColor,
            width: blockWidth * .5,
          ),
        ),
        color: bgColor,
        textColor: textColor,
        splashColor: Colors.blue[200],
        child: Text(
          title,
          style: TextStyle(
            fontSize: (fontSize != null) ? fontSize : blockHeight * 3,
            fontWeight: (fontWeight != null) ? fontWeight : FontWeight.w400,
          ),
        ),
        onPressed: () {
          callback();
        },
      ),
    );
  }
}
