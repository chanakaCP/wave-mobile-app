import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final firestoreInstance = FirebaseFirestore.instance;
  final storageInstance = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  changeProfilePic(String profilePicURL) async {
    User user = _auth.currentUser;
    try {
      await firestoreInstance
          .collection('users')
          .doc(user.uid.toString())
          .update({
            'profilePic' : profilePicURL
          });
    } catch (e) {
      print("ERROR WHILE UPLOADING DATA : " + e.toString());
    }
  }


  Future<String> uploadFile(File file, String filename) async {
    StorageReference storageReference = storageInstance.ref();
    StorageUploadTask uploadTask;
    User user = _auth.currentUser;
    String url;
    try {
      uploadTask = storageReference.child(user.uid.toString()).putFile(file);
      StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
      url = await downloadUrl.ref.getDownloadURL();
    } catch (e) {
      print("ERROR WHILE UPLOADING DOCUMENT : " + e.toString());
      print("DOCUMENT : " + filename);
    }

    return url;
  }
}