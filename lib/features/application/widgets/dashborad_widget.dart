import 'package:dating_assitant_app/features/application/views/dating_home.dart';
import 'package:dating_assitant_app/features/profile/view/profile.dart';
// import 'package:dating_assitant_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

var bottomTabs = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home, size: 27),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person, size: 27),
    label: 'Profile',
  ),
];

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    // Update this when you complete your screens(in-order).
    const HomePage(),
    const Profile()
  ];
  // var ref;
  return screens[index];
}
