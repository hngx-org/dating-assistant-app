import 'package:dating_assitant_app/features/profile/view/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var bottomTabs = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home, size: 27),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.chat_bubble_2_fill, size: 27),
    label: 'Chat',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person, size: 27),
    label: 'Profile',
  ),
];

Widget appScreens({int index = 0}){
  List<Widget> screens = [
    // Update this when you complete your screens(in-order).
    const Center(child: Text('Home Page')),
    const Center(child: Text('Ai Chat Page')),
    const Profile()
  ];
  // var ref;
  return screens[index];
}