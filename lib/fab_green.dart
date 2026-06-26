import 'package:flutter/material.dart';

class FabGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FabGreen();
  }
}

class _FabGreen extends State<FabGreen> {
  var _fabIcon = Icons.favorite_border;

  void onPressedFav() {
    //setState(() actualiza el estado del widget
    setState(() {
      if (_fabIcon == Icons.favorite_border) {
        _fabIcon = Icons.favorite;
      } else {
        _fabIcon = Icons.favorite_border;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final fabGreen = FloatingActionButton(
      backgroundColor: Color(0xFF0da64b),
      mini: true,
      tooltip: "Fab",
      child: Icon(_fabIcon, color: Colors.white),
      onPressed: onPressedFav,
    );
    return fabGreen;
  }
}
