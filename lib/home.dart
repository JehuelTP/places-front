import 'package:flutter/material.dart';
import 'package:places/card_image.dart';
import 'package:places/gradient_back.dart';
import 'package:places/home_appbar.dart';
import 'package:places/review.dart';
import 'package:places/review_list.dart';

import 'description_place.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final descriptionPlace = Container(
      margin: EdgeInsets.only(
        top: 300,
        left: 25,
        right: 25
      ),
      child: DescriptionPlace("Uyuni", 4, "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original."),
    );

    final reviewList = Container(
      margin: EdgeInsets.only(
          top: 20,
          left: 25,
          right: 25
      ),
      child: ReviewList()
    );

    //listView
    final listView = ListView(
      children: <Widget>[
        descriptionPlace,
        reviewList
      ],
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          listView,
          HomeAppBar("Popular")
        ],
      )
    );
  }
}