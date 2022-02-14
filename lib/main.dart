import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shamil/screen/splash_screen.dart';

import 'model/app.dart';

List<App> apps = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shamil",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(),
    );
  }
}
