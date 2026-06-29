import 'package:flutter/material.dart';

import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardImageList = Container(
      height: 330,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage(id: 1, path: "assets/images/lugar1.jpg"),
          CardImage(id: 1, path: "assets/images/lugar2.jpg"),
          CardImage(id: 1, path: "assets/images/lugar3.jpg"),
          CardImage(id: 1, path: "assets/images/lugar4.jpg"),
          CardImage(id: 1, path: "assets/images/lugar5.jpg"),
          CardImage(id: 1, path: "assets/images/lugar6.jpg"),
        ],
      ),
    );

    return cardImageList;
  }
}