import 'package:flutter/cupertino.dart';

import 'package:wave_mobile_app/Services/AuthService.dart';

class ProfileScreenViewModel extends ChangeNotifier {
  onClickLogout() async {
    await AuthService().signOut();
  }
}
