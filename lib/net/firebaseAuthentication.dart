import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    print(e);
    return false;
  }
}

Future<bool> login(String email, String password) async {
  try {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    print(e);
    return false;
  }
}

Future<bool> addCoinToFirebase(String coinName, String amount) async {
  try {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    var enterAmount = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance.collection('All_users').doc(userId).collection('Coins').doc(coinName);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if(!snapshot.exists){
        documentReference.set({'Amount': enterAmount});
        return true;
      }
      double newAmout = snapshot.get('Amount') + enterAmount;
      transaction.update(documentReference, {'Amount': newAmout});
      return true;
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}