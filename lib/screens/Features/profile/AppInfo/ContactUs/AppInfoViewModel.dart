import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';

class AppInfoViewModel extends ChangeNotifier{
  final AuthService authService = AuthService();

  final String city = "Thanamalwila";
  final String address = "Thanamalwila";
  final String phoneNum = "+94716816135";
  final String email = "shan@xdoto.io";
  final String webName = "pub.dev";
  final String webURL = "http://pub.dev";
  final String fbName = "Shan Manage";
  final String fbURL = "http://pub.dev";

  Future<void> makePhoneCall() async {
    String url = 'tel:$phoneNum';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // todo; call failed error
      throw 'Could not launch $url';
    }
  }

  Future<void> sendMail() async {
    String url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // todo; call failed error
      throw 'Could not launch $url';
    }
  }

  Future<void> launchInBrowser(String url) async {
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

}