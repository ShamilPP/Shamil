import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamil/model/app.dart';
import 'package:universal_html/html.dart' as html;

import '../provider/app_provider.dart';
import '../screen/app_details/app_details.dart';

class CheckUpdate extends StatelessWidget {
  const CheckUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _showMyDialog(context);
        },
        child: const Text("Update"),
        style: ElevatedButton.styleFrom(primary: Colors.red),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Available'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(Platform.isAndroid
                    ? 'Download or Update this app'
                    : 'Reload this page'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(Platform.isAndroid ? "Download" : "Reload"),
              onPressed: () {
                Navigator.pop(context);
                if (Platform.isAndroid) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) =>
                              AppDetails(app: findBatteryManager(context))));
                } else {
                  html.window.location.reload();
                }
              },
            ),
          ],
        );
      },
    );
  }

  App findBatteryManager(BuildContext context) {
    return Provider.of<AppProvider>(context, listen: false).apps.where((item) {
      if (item.appName.contains("Battery")) {
        return true;
      } else {
        return false;
      }
    }).first;
  }
}
