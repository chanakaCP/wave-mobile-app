import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

import '../../../../Services/databaseService.dart';
import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomAlertDialog.dart';
import '../../../CustomWidgets/CustomProfileTabContainer.dart';
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
    print("profile URL" + profilePicURL.toString());
    if (profilePicURL != null) {
      try {
        dbService.changeProfilePic(profilePicURL);
      } catch (e) {
        print("ERROR ON ADD DOCUMENT SCREEN : " + e.toString());
      }
    }
  }

  Future pickFile(BuildContext context) async {
    try {
      profilePic = await FilePicker.getFile(type: FileType.IMAGE);
      profilePicName = path.basename(profilePic.path);
      // print("local path" + profilePicName);
      if (profilePic != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: "Warning !",
              description: "Are you sure you want to change profile pic ?",
              callbackYes: () {
                onClickUpload();
                Get.back();
              },
              callbackNo: () {
                Get.back();
              },
            );
          },
        );
      }
    } on PlatformException catch (e) {
      print("ERROR WHILE PICKING DOCUMENT :" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            InkWell(
              child: Container(
                height: blockHeight * 15,
                alignment: Alignment(0.0, -10.0),
                child: CircleAvatar(
                  // backgroundImage: NetworkImage("https://drive.google.com/file/d/1Ulwa3Z3RZ7OLCgARnrIrHyY1L53Z0scz/view?usp=sharing"),
                  backgroundColor: Colors.blueGrey[100],
                  radius: 60.0,
                ),
              ),
              onTap: () {
                pickFile(context);
              },
            ),
            Divider(
              height: blockHeight,
              color: Colors.blue[800],
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
