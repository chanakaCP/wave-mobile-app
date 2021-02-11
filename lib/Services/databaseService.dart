import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wave_mobile_app/models/CardDetails.dart';

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
          .update({'profilePic': profilePicURL});
    } catch (e) {
      print("ERROR WHILE UPLOADING DATA : " + e.toString());
    }
  }

  addCardDetails(CardDetails card) async {
    User user = _auth.currentUser;
    try {
      await firestoreInstance
          .collection('users')
          .doc(user.uid.toString())
          .update({
        'cardInfo': FieldValue.arrayUnion([
          {
            "cardNumber": card.cardNumber,
            "name": card.name,
            "validate": card.validate,
            "cvv": card.cvv
          }
        ])
      });
    } catch (e) {
      print("ERROR WHILE UPLOADING DATA : " + e.toString());
    }
  }

  delCardDetails(CardDetails card) async {
    User user = _auth.currentUser;
    try {
      await firestoreInstance
          .collection('users')
          .doc(user.uid.toString())
          .update({
        'cardInfo': FieldValue.arrayRemove([
          {
            "cardNumber": card.cardNumber,
            "name": card.name,
            "validate": card.validate,
            "cvv": card.cvv
          }
        ])
      });
    } catch (e) {
      print("ERROR WHILE DELETING CARD : " + e.toString());
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

  Stream<dynamic> getCards() {
    User user = _auth.currentUser;
    Stream<DocumentSnapshot> snapshot;
    try {
      snapshot = firestoreInstance
          .collection("users")
          .doc(user.uid.toString())
          .snapshots();
      // List<Card>
    } catch (e) {
      print(" ERROR WHILE GETTING DATA (payments): " + e.toString());
    }

    return snapshot;
  }

  Stream<dynamic> getPaymentHistory() {
    User user = _auth.currentUser;
    Stream<DocumentSnapshot> snapshot;

    try {
      snapshot = firestoreInstance
          .collection("payments")
          .doc(user.uid.toString())
          .snapshots();
    } catch (e) {
      print("ERROR WHILE GETTING PAYAMENT DETAILS :" + e.toString());
    }
    return snapshot;
  }

  Stream<dynamic> getBillDetails(String billType, String billNumber) {
    Stream<DocumentSnapshot> snapshot;
    try {
      snapshot =
          firestoreInstance.collection(billType).doc(billNumber).snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA ($billType): " + e.toString());
    }
    return snapshot;
  }

  Stream<dynamic> getInsuranceDetails() {
    Stream<QuerySnapshot> snapshot;
    try {
      snapshot = firestoreInstance.collection("insuranceCompanies").snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA (insuranceCompanies): " + e.toString());
    }
    return snapshot;
  }

  Stream<dynamic> getInsuranceBillDetails(String company, String billNumber) {
    Stream<DocumentSnapshot> snapshot;
    try {
      snapshot = firestoreInstance
          .collection("insuranceCompanies")
          .doc(company)
          .collection("insuranceBills")
          .doc(billNumber)
          .snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA (insuranceBill): " + e.toString());
    }
    return snapshot;
  }

  Stream<dynamic> getStationList() {
    Stream<QuerySnapshot> snapshot;
    try {
      snapshot = firestoreInstance.collection("policeStations").snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA (policeStations): " + e.toString());
    }
    return snapshot;
  }

  Stream<dynamic> getFineDetails(String stationName, String fineId) {
    Stream<DocumentSnapshot> snapshot;
    try {
      snapshot = firestoreInstance
          .collection("policeStations")
          .doc(stationName)
          .collection("trafficFines")
          .doc(fineId)
          .snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA (trafficFines): " + e.toString());
    }
    return snapshot;
  }

  Stream<dynamic> getMediaList(String mediaType) {
    Stream<QuerySnapshot> snapshot;
    try {
      snapshot = firestoreInstance.collection(mediaType).snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA (policeStations): " + e.toString());
    }
    return snapshot;
  }
}
