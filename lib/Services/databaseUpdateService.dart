import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wave_mobile_app/models/Payment.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/snackbar/CustomSuccessSnackBar.dart';

class DatabaseUPdateService {
  final firestoreInstance = FirebaseFirestore.instance;
  final storageInstance = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  addPaymentDetails(Payment payment) async {
    User user = _auth.currentUser;
    try {
      await firestoreInstance
          .collection('users')
          .doc(user.uid.toString())
          .update({
        'paymentHistory': FieldValue.arrayUnion([
          {
            "ID": payment.id,
            "billNo": payment.billNo,
            "timestamp": payment.date,
            "amount": payment.amount,
            "status": payment.status,
            "type": payment.type
          }
        ])
      });
    } catch (e) {
      CustomSnackBar()
          .notify(msg: "Payment succsess, Error While updating database");
      print("ERROR WHILE UPLOADING DATA : " + e.toString());
    }
  }
}
