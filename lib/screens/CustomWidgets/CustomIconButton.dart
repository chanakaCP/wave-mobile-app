import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  IconData icon;
  final VoidCallback callback;
  Color color;
  CustomIconButton({@required this.icon, @required this.callback, this.color});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(blockWidth * 2),
        decoration: BoxDecoration(
          color: Colors.blue[100].withOpacity(0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Icon(
          icon,
          color: (color != null) ? color : Colors.blue,
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
