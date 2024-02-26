
import 'package:buyrent/screens/profile_pages/editprofile.dart';
import 'package:buyrent/screens/profile_pages/sellrent_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../providers/profile_providers.dart';



  class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
  }


class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(child: Image.asset("/profilepic3.png"),maxRadius: 60),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(

                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileCreation(

                        )),
                      );
                        },
                      child: Text("Edit Profile")
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
               Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("${controller.name}"),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text("${controller.email}"),
                ),
              ),Card(
                margin: EdgeInsets.symmetric(horizontal: 20,),
                child: ListTile(
                  leading: Icon(Icons.numbers),
                  title: Text("${controller.number}"),
                ),
              ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SellPage()),
                    );
                  },
                  child: Text("Sell/Rent")),
            )


          ],
        ),
      ),
    );
  }
}
