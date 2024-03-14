import 'package:enchanteddiary/main.dart';
import 'package:flutter/material.dart';
import 'package:enchanteddiary/settings.dart';
import 'package:enchanteddiary/cloud_page.dart';
import 'package:enchanteddiary/search_page.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cloud()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: "Cloud",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ]);
  }
}
