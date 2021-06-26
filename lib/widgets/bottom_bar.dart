import 'package:flutter/material.dart';

class BottomBarItems {
  static getItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Config',
      ),
    ];
  }
}
