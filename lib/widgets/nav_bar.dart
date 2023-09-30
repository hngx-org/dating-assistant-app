import 'package:dating_assitant_app/screens/dating_assitant.dart';
import 'package:flutter/material.dart';

import '../commons/utils/colors.dart';

class TabBar extends StatefulWidget {
  const TabBar({super.key});

  @override
  State<TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const DatingAssistantHome();

    if (_selectedPageIndex == 1) {
      activePage = const ChatScreen();
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ProjectColors.white,
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          selectedItemColor: ProjectColors.pink,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: ProjectColors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: ProjectColors.black,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: ProjectColors.black,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
