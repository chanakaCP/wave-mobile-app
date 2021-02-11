import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomIconButton.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CustomContactRow extends StatelessWidget {
  String email, contactNumber, facebook, web;
  CustomContactRow({this.email, this.contactNumber, this.facebook, this.web});

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
          (this.web != null)
              ? CustomIconButton(
                  icon: Icons.web,
                  callback: () {},
                )
              : Container(),
          SizedBox(width: blockWidth * 5),
          (this.facebook != null)
              ? CustomIconButton(
                  icon: Icons.link,
                  callback: () {},
                )
              : Container(),
          (this.email != null)
              ? CustomIconButton(
                  icon: Icons.alternate_email_outlined,
                  callback: () {
                    _sendMail();
                  },
                )
              : Container(),
          SizedBox(width: blockWidth * 5),
          (this.contactNumber != null)
              ? CustomIconButton(
                  icon: Icons.call,
                  callback: () {
                    _makePhoneCall();
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
