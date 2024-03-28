import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/search/search_page.dart';
import 'package:enchanteddiary/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:enchanteddiary/settings.dart';
import 'package:enchanteddiary/cloud/cloud_page.dart';
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CalendarPage()));
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
            context, MaterialPageRoute(builder: (context) => SettingWidget()));
        break;
    }
  }

  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: skyBlue,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "HOME",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud),
          label: "CLOUD",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "SEARCH",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "SETTINGS",
        ),
      ],
      selectedItemColor: darkBlue,
      unselectedItemColor: darkBlue,
      selectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
      unselectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
    );
  }
}
