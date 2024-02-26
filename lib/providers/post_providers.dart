import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserController1 extends ChangeNotifier {





   Future<void> addUser1({ String? name,
   String? dop,
   String? sr,
   String? amount,
   String? dor})async{
    // final uid=FirebaseAuth.instance.currentUser!.uid;
    // print("$name $dop $sr $amount $dor");
    try{
      await FirebaseFirestore.instance.collection("Post").add({
      "name":name,
      "dop":dop,
      "sr":sr,
      "amount":amount,
      "dor":dor,
      });
    }
    catch(e){
      print(e);
    }
  }
}







