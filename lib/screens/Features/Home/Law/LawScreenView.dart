import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/Features/Home/Law/LawScreenViewModel.dart';

class LawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LawScreenViewModel>.reactive(
      viewModelBuilder: () => LawScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                RaisedButton(
                  onPressed: () async {
                    await model.authService.signOut();
                  },
                  child: Text("LOGOUT"),
                )
              ],
            ),
            body: Container(
              child: Text("Law screen"),
            ),
          ),
        );
      },
    );
  }
}
