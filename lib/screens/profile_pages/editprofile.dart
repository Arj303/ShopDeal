
import 'package:buyrent/providers/profile_providers.dart';
import 'package:buyrent/screens/profile_pages/ProfilePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProfileCreation extends StatefulWidget {

   ProfileCreation({super.key});

  @override
  State<ProfileCreation> createState() => _ProfileCreationState();
}

class _ProfileCreationState extends State<ProfileCreation> {



  TextEditingController name1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController number1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<UserController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Edit Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  SizedBox(height: 20,),
                  Text("edit your profile information",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Column(
                children: <Widget>[
                  TextFormField( decoration: InputDecoration(labelText: 'Name'),controller: name1,),
                  TextFormField( decoration: InputDecoration(labelText: 'Email'),controller: email1,),
                  TextFormField( decoration: InputDecoration(labelText: 'Phone number'),controller: number1,),
                ],
              ),

              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  height: 60,
                  minWidth: double.infinity,
                  onPressed: (){
                    controller.updateUser(name1.text, email1.text, number1.text);
                    controller.fetchData();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  color: Color(0xff0095FF),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xff0095FF),
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),


                ),



              ),


            ],

          ),


        ),

      ),

    );
  }
}
