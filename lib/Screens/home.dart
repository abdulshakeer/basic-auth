import 'package:flutter/material.dart';
import 'package:loginapp/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }

  Future<void> logout() async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LoginPage()), (route) => false);
  }
}
