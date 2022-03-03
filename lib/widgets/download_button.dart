import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  final void Function() onTap;

  const DownloadButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      color: Colors.green,
      child: Material(
        color: Colors.green,
        child: InkWell(
          splashColor: Colors.black,
          onTap: onTap,
          child: SizedBox(
            width: 160,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                SizedBox(width: 7),
                Text(
                  "Download",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
