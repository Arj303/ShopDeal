import 'package:buyrent/controllers/profileController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProfileCreation extends StatefulWidget {

   ProfileCreation({super.key});

  @override
  State<ProfileCreation> createState() => _ProfileCreationState();
}

class _ProfileCreationState extends State<ProfileCreation> {

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _bio = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, save or process the data
      // For example, you can save the data to a database or navigate to another screen
      print('Name: $_name');
      print('Email: $_email');
      print('Bio: $_bio');

    }
  }


  TextEditingController name1 = TextEditingController();
  TextEditingController email1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: name1,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: email1,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more complex email validation if needed
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _bio = value;
                  });
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  profile.setProfile(name1.text, email1.text);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
