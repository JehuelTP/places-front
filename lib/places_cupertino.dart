import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:places/home.dart';
import 'package:places/profile_places.dart';
import 'package:places/search_places.dart';

class PlacesCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white.withAlpha(50),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0xFF574ACF),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color(0xFF574ACF),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color(0xFF574ACF),
              ),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => MyHome(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchPlaces(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => ProfilePlaces(),
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext context) => MyHome(),
              );
          }
        },
      ),
    );
  }
}
