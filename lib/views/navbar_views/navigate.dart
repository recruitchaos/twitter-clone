import 'package:flutter/material.dart';
import 'package:twitter_clone/views/navbar_views/homepage.dart';
import 'package:twitter_clone/views/navbar_views/message_page.dart';
import 'package:twitter_clone/views/navbar_views/notification_page.dart';
import 'package:twitter_clone/views/navbar_views/search_page.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {

  int _selectedIndex = 0;

  static const List<Widget> _widgets = <Widget> [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    MessagePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: Colors.black, fill: IconThemeData.fallback().fill),
        unselectedItemColor: Colors.black87,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline_sharp), label: ""),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        ),
        body: Center(
          child: _widgets.elementAt(_selectedIndex),
        ),
    );
  }
}