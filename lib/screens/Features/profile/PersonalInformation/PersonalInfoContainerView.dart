import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomProfileTabContainer.dart';
import 'ChangePassword/ChangePasswordView.dart';

// ignore: must_be_immutable
class PersonalInfoContainer extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  DatabaseService dbService = DatabaseService();

  File profilePic;
  String profilePicName;
  String profilePicURL;

  onClickUpload() async {
    profilePicURL = await dbService.uploadFile(profilePic, profilePicName);
    print(profilePicURL.toString());
    if (profilePicURL != null) {
      try {
        dbService.changeProfilePic(profilePicURL);
      } catch (e) {
        print("ERROR ON ADD DOCUMENT SCREEN : " + e.toString());
      }
    }
  }

  Future pickFile() async {
    try {
      profilePic = await FilePicker.getFile(type: FileType.IMAGE);
      profilePicName = path.basename(profilePic.path);
      print(profilePicName);
      onClickUpload();
    } on PlatformException catch (e) {
      print("ERROR WHILE PICKING DOCUMENT : " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            InkWell(
              child: Container(
                height: blockWidth * 30,
                alignment: Alignment(0.0, -20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey[100],
                  radius: 60.0,
                ),
              ),
              onTap: () {
                pickFile();
              },
            ),
            Divider(
              height: blockHeight,
            ),
            CustomProfileTabContainer(
              title: "Change Password",
              callback: () {
                Get.to(ChangePasswordView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
