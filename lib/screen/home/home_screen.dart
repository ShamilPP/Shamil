import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shamil/screen/settings/settings_screen.dart';

import 'my_all_apps.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Apps"),
        leading: IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Coming soon\nNext Update will be fix",
                  backgroundColor: Colors.red);
            },
            icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Coming soon\nNext Update will be fix",
                  backgroundColor: Colors.red);
            },
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: "Settings",
                      child: Text("Setting"),
                    ),
                    const PopupMenuItem(
                      value: "About",
                      child: Text("About"),
                    ),
                  ],
              onSelected: (item) {
                switch (item) {
                  case "Settings":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const SettingsScreen()));
                    break;
                  case "About":
                    Fluttertoast.showToast(
                        msg: "Developer : SHAMIL", backgroundColor: Colors.red);
                    break;
                }
              }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SortBy(),
          MyAllApps(),
        ],
      ),
    );
  }
}

class SortBy extends StatelessWidget {
  const SortBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 55,
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
              msg: "Coming soon\nNext Update will be fix",
              backgroundColor: Colors.red);
        },
        child: Row(
          children: const [
            SizedBox(width: 20),
            Icon(Icons.filter_list),
            SizedBox(width: 15),
            Text(
              "Sort By",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
