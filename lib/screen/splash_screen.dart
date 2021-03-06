import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamil/model/app.dart';
import 'package:shamil/provider/app_provider.dart';

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
    List<App> apps = [];
    String serverVersion = "";
    AppProvider provider = Provider.of<AppProvider>(context, listen: false);

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Apps').get();
    var allData = querySnapshot.docs;
    for (int i = 0; i < allData.length; i++) {
      apps.add(App(
        appName: allData[i].get("name"),
        packageName: allData[i].get("package"),
        description: allData[i].get("description"),
        appIcon: allData[i].get("icon"),
        version: allData[i].get("version"),
        rating: allData[i].get("rating"),
      ));
    }
    // Get Version
    await FirebaseFirestore.instance.collection('Version').get().then((value) {
      serverVersion = value.docs.first.get("version");
    });

    // Update Provider

    provider.apps = apps;
    provider.serverVersion = serverVersion;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (builder) => const HomeScreen()));
  }
}
