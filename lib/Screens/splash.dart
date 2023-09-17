import 'package:flutter/material.dart';
import 'package:loginapp/Screens/home.dart';
import 'package:loginapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome Screen')),
    );
  }

  Future<void> delayScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPreference = await SharedPreferences.getInstance();
    final _userLoggedIn = await _sharedPreference.getBool(VALUE);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      delayScreen();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }
  }
}
