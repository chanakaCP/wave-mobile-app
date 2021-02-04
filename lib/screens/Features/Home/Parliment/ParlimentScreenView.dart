import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/Features/Home/Parliment/ParlimentScreenViewModel.dart';

class ParlimentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParlimentScreenViewModel>.reactive(
      viewModelBuilder: () => ParlimentScreenViewModel(),
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
              child: Text("Parliment screen"),
            ),
          ),
        );
      },
    );
  }
}
