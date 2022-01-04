import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huruf/beranda.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startLaunching();

    super.initState();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 5);
    // ignore: unnecessary_new
    return new Timer(duration, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const Beranda();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang Di \n Permainan Mencari Huruf \n oleh Anggyanisa 19.01.55.0009",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              "assets/abjad.png",
              height: 200,
              width: 500,
            ),
          ],
        )),
      ),
    );
  }
}
