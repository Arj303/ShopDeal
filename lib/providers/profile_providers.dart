import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends ChangeNotifier{

  Future addUser(String name,String email,String number)async{
    final uid=FirebaseAuth.instance.currentUser!.uid;
    try{
      await FirebaseFirestore.instance.collection("Profile").doc(uid).set({
       "name":name,
       "email":email,
       "number":number,
      });
    }
        catch(e){
      print(e);
        }
  }

  Future updateUser(String name,String email,String number)async{
    final uid=FirebaseAuth.instance.currentUser!.uid;
    try{
      await FirebaseFirestore.instance.collection("Profile").doc(uid).update({
        "name":name,
        "email":email,
        "number":number,
      });
    }
    catch(e){
      print(e);
    }

  }

String name='';
String email='';
String number='';
  Future fetchData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docSnapshot = await FirebaseFirestore.instance.collection("Profile")
        .doc(userId)
        .get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      name=data?["name"];
      email=data?["email"];
      number=data?["number"];
      notifyListeners();
      return data;
    }
  }



  // void ImagePick()async{
  //   ImagePicker imagePicker = ImagePicker();
  //   XFile? file =
  //       await imagePicker.pickImage(source: ImageSource.camera);
  //   print('${file?.path}');
  //
  //   if (file == null) return;
  //   //Import dart:core
  //   String uniqueFileName =
  //   DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference referenceRoot = FirebaseStorage.instance.ref();
  //   Reference referenceDirImages =
  //   referenceRoot.child('images');
  //
  //   //Create a reference for the image to be stored
  //   Reference referenceImageToUpload =
  //   referenceDirImages.child(uniqueFileName+".png");
  //
  //   //Handle errors/success
  //   try {
  //     //Store the file
  //     await referenceImageToUpload.putFile(File(file.path));
  //     //Success: get the download URL
  //     var imageUrl = await referenceImageToUpload.getDownloadURL();
  //
  //     print(imageUrl);
  //   }
  //   catch(e){
  //     print(e);
  //   }
  //
  // }







}
