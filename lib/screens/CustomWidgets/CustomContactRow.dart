import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomIconButton.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CustomContactRow extends StatelessWidget {
  String email, contactNumber, facebook, web;
  bool isOnExpand;
  CustomContactRow(
      {this.email,
      this.contactNumber,
      this.facebook,
      this.web,
      this.isOnExpand});

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

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: (isOnExpand == false || isOnExpand == null)
            ? blockHeight * 2
            : blockHeight * 5,
        left: blockWidth * 5,
        right: (isOnExpand == false || isOnExpand == null)
            ? blockWidth * 2.5
            : blockWidth * 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          (this.web != null) ? SizedBox(width: blockWidth * 5) : Container(),
          (this.web != null)
              ? CustomIconButton(
                  icon: Icons.web,
                  callback: () {
                    _launchInBrowser(web);
                  },
                )
              : Container(),
          (this.facebook != null)
              ? SizedBox(width: blockWidth * 5)
              : Container(),
          (this.facebook != null)
              ? CustomIconButton(
                  icon: Icons.link,
                  callback: () {
                    _launchInBrowser(facebook);
                  },
                )
              : Container(),
          (this.email != null) ? SizedBox(width: blockWidth * 5) : Container(),
          (this.email != null)
              ? CustomIconButton(
                  icon: Icons.alternate_email_outlined,
                  callback: () {
                    _sendMail();
                  },
                )
              : Container(),
          (this.contactNumber != null)
              ? SizedBox(width: blockWidth * 5)
              : Container(),
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
