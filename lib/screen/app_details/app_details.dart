import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shamil/model/app.dart';
import 'package:shamil/widgets/app_rating.dart';
import 'package:shamil/widgets/download_button.dart';

class AppDetails extends StatelessWidget {
  final App app;

  const AppDetails({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(app.appName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 30, right: 40, bottom: 15),
                  child: Image.network(
                    app.appIcon,
                    height: 100,
                    width: 100,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      app.appName,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    DownloadButton(onTap: _downloadApp),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                app.description,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  border: TableBorder.all(),
                  // Allows to add a border decoration around your table
                  children: [
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'App',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          app.appName,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Package',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          app.packageName,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Ratings',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppRating(rating: double.parse(app.rating))),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Version',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          app.version,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
                  ]),
            ),
            DownloadButton(onTap: _downloadApp)
          ],
        ),
      ),
    );
  }

  void _downloadApp() {
    Fluttertoast.showToast(msg: "Currently unavailable");
  }
}
