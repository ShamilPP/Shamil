import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';

class MyAllApps extends StatefulWidget {
  const MyAllApps({Key? key}) : super(key: key);

  @override
  _MyAllAppsState createState() => _MyAllAppsState();
}

class _MyAllAppsState extends State<MyAllApps> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return AppList(
            appName: apps[index].appName,
            appIcon: apps[index].appIcon,
            appVersion: apps[index].version,
            appRating: double.parse(apps[index].rating),
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
  final String appName;
  final String appIcon;
  final String appVersion;
  final double appRating;

  const AppList({
    Key? key,
    required this.appName,
    required this.appIcon,
    required this.appVersion,
    required this.appRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
            msg: "Coming soon\nNext Update will be fix",
            backgroundColor: Colors.red);
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
            SizedBox(width: 70, height: 70, child: Image.network(appIcon)),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Version : " + appVersion,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                AppRating(rate: appRating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppRating extends StatefulWidget {
  final double rate;

  const AppRating({Key? key, required this.rate}) : super(key: key);

  @override
  _AppRatingState createState() => _AppRatingState();
}

class _AppRatingState extends State<AppRating> {
  final List<Widget> _rating = [];

  @override
  void initState() {
    loadStar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: _rating);
  }

  loadStar() {
    double rating = widget.rate;

    int stars = rating.toInt();
    int unStars = 5 - rating.round();
    bool isHalf = stars + unStars != 5;

    for (int i = 0; i < stars; i++) {
      _rating.add(const Icon(
        Icons.star,
        color: Colors.orange,
        size: 18,
      ));
    }
    if (isHalf) {
      _rating.add(const Icon(
        Icons.star_half,
        color: Colors.orange,
        size: 18,
      ));
    }
    for (int i = 0; i < unStars; i++) {
      _rating.add(const Icon(
        Icons.star_border,
        color: Colors.orange,
        size: 18,
      ));
    }
    // Rating Text
    _rating.add(Text(" ( "+rating.toString()+" Rating)"));
  }
}
