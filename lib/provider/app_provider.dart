import 'package:flutter/material.dart';

import '../model/app.dart';

class AppProvider extends ChangeNotifier {
  List<App> apps = [];
  String currentVersion = '3';
  String serverVersion = '3';
}
