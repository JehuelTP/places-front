import 'package:flutter/material.dart';
import 'package:places/rounded_button.dart';

class DescriptionPlace extends StatelessWidget {
  //variables
  String textoTitulo;
  int cantidadEstrellas;
  String textoDescription;

  DescriptionPlace(this.textoTitulo, this.cantidadEstrellas, this.textoDescription);


  @override
  Widget build(BuildContext context) {
    final titulo = Container(
      margin: EdgeInsets.only(
        right: 20
      ),
      child: Text(
        textoTitulo,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 38,
          fontWeight: FontWeight.bold
        ),
      ),
    );

    final estrella = Container(
      margin: EdgeInsets.only(
        right: 5
      ),
      child: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    final estrellaBorde = Container(
      margin: EdgeInsets.only(
        right: 5
      ),
      child: Icon(
        Icons.star_border,
        color: Colors.black54,
      ),
    );

    // fila estrellas
    List<Container> estrellas = [];

    for (int i = 0; i < 5; i++) {
      if (i < cantidadEstrellas) {
        estrellas.add(estrella);
      } else {
        estrellas.add(estrellaBorde);
      }
    }


    final filaEstrellas = Row(
      children: estrellas,
    );

    final filaTitulo = Row(
      children: <Widget>[
        titulo,
        filaEstrellas
      ],
    );

    final description = Container(
      margin: EdgeInsets.only(
          top: 10
      ),
      child: Text(
        textoDescription,
        style: TextStyle(
            fontFamily: "Lato",
            color: Colors.black54
        ),
      ),
    );

    final descriptionPlace = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        filaTitulo,
        description,
        RoundedButton("Navigate")
      ],
    );

    return descriptionPlace;
  }
}