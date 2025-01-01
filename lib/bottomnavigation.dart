import 'package:flutter/material.dart';
import 'package:login_app/Profile.dart';
import 'package:login_app/Services/notescreen.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  List pages = [Notescreen(), Profile()];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar
      (
        onTap: (value) {
          setState(() {
            selectedIndex=value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.note), label: "note"),
        BottomNavigationBarItem(icon: Icon(Icons.lock), label: "lock"),
      ]),
    );
  }
}
