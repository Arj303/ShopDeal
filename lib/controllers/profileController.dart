import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier{
String? name;
String? email;

void setProfile(String a,String b){
  name=a;
email=b;
  notifyListeners();
}


}