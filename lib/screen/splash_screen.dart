import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamil/main.dart';
import 'package:shamil/model/app.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    gotoHomeScreen(context);
    return Scaffold(
        body: Center(
      child: Image.asset("assets/icon.png", width: 100, height: 100),
    ));
  }

  void gotoHomeScreen(BuildContext context) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Apps').get();
    var allData = querySnapshot.docs;
    for (int i = 0; i < allData.length; i++) {
      apps.add(App(
        appName: allData[i].get("name"),
        packageName: allData[i].get("package"),
        appIcon: allData[i].get("icon"),
        version: allData[i].get("version"),
        rating: allData[i].get("rating"),
      ));
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (builder) => const HomeScreen()));
  }
}
