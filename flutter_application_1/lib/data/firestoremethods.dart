import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/presentation/widgets/meeting_options.dart';

class FireStoreMethods {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static Stream<QuerySnapshot<Map<String, dynamic>>> get history => firestore
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .collection("meetings")
      .snapshots();
  static void addHistoryMeeting({required String MettingName}) async {
    await firestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("meetings")
        .add({"meeting_name": MettingName, "created at": DateTime.now()});
  }
}
