import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomIconButton.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CustomContactRow extends StatelessWidget {
  String email, contactNumber;
  CustomContactRow({@required this.email, @required this.contactNumber});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  Future<void> _makePhoneCall() async {
    String url = 'tel:$contactNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // todo; call failed error
      throw 'Could not launch $url';
    }
  }
  Future<void> _sendMail() async {
    String url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // todo; call failed error
      throw 'Could not launch $url';
    }
  }

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
              _sendMail();
            },
          ),
          SizedBox(width: blockWidth * 5),
          CustomIconButton(
            icon: Icons.call,
            callback: () {
              _makePhoneCall();
            },
          ),
        ],
      ),
    );
  }
}
