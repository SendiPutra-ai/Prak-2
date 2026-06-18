import 'dart:async';
import 'package:flutter/material.dart';
import 'pages/register.dart';

class SplashScreen extends StatefulWidget {
  BuildContext get context => null;

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MovieHome()));
    });
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
