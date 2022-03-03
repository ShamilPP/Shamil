import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamil/model/app.dart';
import 'package:shamil/screen/app_details/app_details.dart';

import '../../provider/app_provider.dart';
import '../../widgets/app_rating.dart';

class MyAllApps extends StatefulWidget {
  const MyAllApps({Key? key}) : super(key: key);

  @override
  _MyAllAppsState createState() => _MyAllAppsState();
}

class _MyAllAppsState extends State<MyAllApps> {
  List<App> apps = [];

  @override
  Widget build(BuildContext context) {
    apps = Provider.of<AppProvider>(context).apps;
    return Expanded(
      child: ListView.separated(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return AppList(
            app: apps[index],
            // appName: apps[index].appName,
            // appIcon: apps[index].appIcon,
            // appVersion: apps[index].version,
            // appRating: double.parse(apps[index].rating),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }
}

class AppList extends StatelessWidget {
  final App app;

  const AppList({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => AppDetails(app: app)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(width: 70, height: 70, child: Image.network(app.appIcon)),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.appName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Version : " + app.version,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                AppRating(
                  rating: double.parse(app.rating),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
