import 'package:flutter/material.dart';
import 'package:places/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //reviewList
    final reviewList = Column(
      children: <Widget>[
        Review("assets/images/usuario1.jpg", "Laura Leon", "1 reviews - 3 photos", 3, "Muy buen luhar para visitar."),
        Review("assets/images/usuario2.jpg", "Maria Eugenia", "4 reviews - 2 photos", 4, "Nunca visite el lugar."),
        Review("assets/images/usuario4.jpg", "Lorena", "3 reviews - 2 photos", 5, "Lo recomiendo bastente."),
        Review("assets/images/persona1.jpg", "Luis", "4 reviews - 4 photos", 2, "Me gustaria conocerlo."),
        Review("assets/images/persona2.jpg", "Carlos", "3 reviews - 4 photos", 3, "Hermoso lugar para visitar.")
      ],
    );

    return reviewList;
  }

}