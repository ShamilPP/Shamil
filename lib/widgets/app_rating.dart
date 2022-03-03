import 'package:flutter/material.dart';

class AppRating extends StatelessWidget {
  final double rating;

  AppRating({Key? key, required this.rating}) : super(key: key);

  final List<Widget> _rating = [];

  @override
  Widget build(BuildContext context) {
    loadStar();
    return Row(children: _rating);
  }

  loadStar() {
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
    _rating.add(Text(" ( " + rating.toString() + " Rating)"));
  }
}
