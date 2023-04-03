import 'package:call_app/screen/add_screen.dart';
import 'package:call_app/screen/contact_screen.dart';
import 'package:call_app/screen/dail_screen.dart';
import 'package:call_app/screen/recent_screen.dart';
import 'package:flutter/material.dart';

class Dashscreen extends StatefulWidget {
  const Dashscreen({Key? key}) : super(key: key);

  @override
  State<Dashscreen> createState() => _DashscreenState();
}

class _DashscreenState extends State<Dashscreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: i,
          children: [
            ContactScreen(),
            Dialscreen(),
            Recentscreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,elevation: 0,
          iconSize: 30,
          currentIndex: i,
          onTap: (value) {
            setState(() {
              i = value;
            });
          },
          items: [
            BottomNavigationBarItem(
               icon: Icon(Icons.call,color: Colors.grey.shade400),
                activeIcon: Icon(Icons.call,color: Colors.blue),
                label: ""),
            BottomNavigationBarItem(
               icon: Icon(Icons.dialpad,color: Colors.grey.shade400),
                activeIcon: Icon(Icons.dialpad,color: Colors.blue),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined,
                    color: Colors.grey.shade400),
                activeIcon: Icon(Icons.watch_later, color: Colors.blue),
                label: ""),
          ],
        ),
      ),
    );
  }
}
