import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';

class AppInfoViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  final String team = "Wave-App Team";
  final String address = "Nugegoda, Colombo LK";
  final String phoneNum = "+94112342342";
  final String email = "mail@waveapp.com";
  final String webName = "www.waveapp.com";
  final String webURL = "http://www.waveapp.com";
  final String fbName = "Wave app";
  final String fbURL = "http://www.fb/waveapp.com";

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
