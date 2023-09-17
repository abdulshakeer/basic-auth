import 'package:flutter/material.dart';
import 'package:loginapp/Screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value is empty";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value is empty";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submit(context);
                      } else {
                        print('Exit');
                      }
                    },
                    child: Text('Submit'),
                  ))
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> submit(BuildContext context) async {
    final _username = usernameController.text;
    final _password = passwordController.text;
    if (_username == _password) {
      final _sharedPreference = await SharedPreferences.getInstance();
      await _sharedPreference.setBool(VALUE, true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } else {
      // snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('username and password doesnot match'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));

      // Alert Dialogues
      // showDialog(
      //     context: context,
      //     builder: (BuildContext ctx1) {
      //       return AlertDialog(
      //         title: Text('Error'),
      //         content: Text('username and password doesnt match!'),
      //         actions: [
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(ctx1).pop();
      //               },
      //               child: Text('Close'))
      //         ],
      //       );
      //     });
    }
  }
}
