import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:wave_mobile_app/Services/databaseService.dart';

import '../../../../Shared/SizeConfig.dart';
import '../../../CustomWidgets/CustomText.dart';
import '../PersonalInformation/ChangePassword/ChangePasswordView.dart';

// ignore: must_be_immutable
class PersonalInfo extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  DatabaseService dbService = DatabaseService();

  File profilePic;
  String profilePicName;
  String profilePicURL;

  onClickUpload() async {
        profilePicURL = await dbService.uploadFile(
            profilePic, profilePicName);
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: blockHeight * 1, horizontal: blockWidth * 1),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    height: 130,
                    alignment: Alignment(0.0, -6.0),
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
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: blockWidth * 7.5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: "Change Password",
                            color: Colors.black,
                            size: blockHeight * 2,
                            weight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(bottom: blockHeight),
                          color: Colors.black,
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: blockHeight * 3,
                          ),
                          onPressed: () {
                            Get.to(ChangePasswordView());
                          },
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(ChangePasswordView());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
