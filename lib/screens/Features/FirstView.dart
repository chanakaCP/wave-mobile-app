import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/models/User.dart';
import 'FirstViewModel.dart';

// ignore: must_be_immutable
class FirstView extends StatelessWidget {
  final LocalUser user;

  FirstView({Key key, this.user}) : super(key: key);

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FirstViewModel>.reactive(
      viewModelBuilder: () => FirstViewModel(),
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
                    height: blockHeight * 86,
                    child: model.children[model.currentIndex],
                  ),
                  Container(
                    height: blockHeight * 7.5,
                    child: BottomNavigationBar(
                      onTap: model.onTabTapped,
                      currentIndex: model.currentIndex,
                      selectedItemColor: Colors.blue[800],
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: "profile",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
