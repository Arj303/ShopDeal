
import 'package:buyrent/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/profileController.dart';



  class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
  }


class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileController>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(

                radius: 50,
                backgroundImage: AssetImage('assets/profilepic3.png')
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(

                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                      onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileCreation(

                        )),
                      );},
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
                  title: Text(profile.name == null?"":profile.name!),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text(profile.name == null?"":profile.email!),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
