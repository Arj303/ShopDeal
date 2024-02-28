import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserController1 extends ChangeNotifier {





   Future<void> addUser1({ String? name,
   String? dop,
   String? sr,
   String? amount,
   String dor="",
   String? imgUrl})async{
    final uid=FirebaseAuth.instance.currentUser!.uid;
    try{
      await FirebaseFirestore.instance.collection("Post").doc(uid).set({
      "name":name,
      "dop":dop,
      "sr":sr,
      "amount":amount,
      "dor":dor,
        "imageURL":imgUrl
      });
    }
    catch(e){
      print(e);
    }
  }


   String name='';
   String dop='';
   String sr='';
   String amount='';
   String dor='';
   String imgUrl='';
   Future fetchData1() async {

     final userId = FirebaseAuth.instance.currentUser!.uid;
     final docSnapshot = await FirebaseFirestore.instance.collection("Post")
         .doc(userId)
         .get();
     if (docSnapshot.exists) {
       Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
       name=data?["name"];
       dop=data?["dop"];
       sr=data?["sr"];
       amount=data?["amount"];
       dor=data?["dor"];
       imgUrl=data?["imageURL"];


       notifyListeners();
       return data;
     }
   }






}









