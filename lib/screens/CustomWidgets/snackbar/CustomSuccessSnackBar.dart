import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void success({String msg}) {
    return Get.snackbar(
      "Success",
      msg,
      icon: Icon(Icons.check),
      backgroundColor: Colors.green[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
    );
  }

  void failed({String msg}) {
    return Get.snackbar(
      "Failed",
      msg,
      icon: Icon(Icons.close),
      backgroundColor: Colors.red[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
    );
  }

  void loading({String msg}) {
    return Get.snackbar(
      "Loading",
      msg,
      icon: Icon(Icons.watch_later_outlined),
      backgroundColor: Colors.blueAccent[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
    );
  }

  void notify({String msg}) {
    return Get.snackbar(
      "Notification",
      msg,
      icon: Icon(Icons.watch_later_outlined),
      backgroundColor: Colors.grey[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
    );
  }

  successWithCallback(
      {BuildContext context, IconData icon, String message, Widget callback}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.black45,
                ),
                SizedBox(width: 20),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            duration: new Duration(milliseconds: 2000),
            backgroundColor: Colors.green[200],
          ),
        )
        .closed
        .then((_) {
      if (callback != null) {
        Get.offAll(callback);
      }
    });
  }

  failedWithCallback(
      {BuildContext context, IconData icon, String message, dynamic callback}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            duration: new Duration(milliseconds: 2000),
            backgroundColor: Colors.red,
          ),
        )
        .closed
        .then((_) {
      if (callback != null) {
        callback();
      }
    });
  }
}
