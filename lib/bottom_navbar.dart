import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'themes/app_color.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key});

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  int selectedIndex = 0;
  void changeIndexSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: AppColor.secondaryColor,
        unselectedItemColor: AppColor.greyColor,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, Routes.homePage);
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
          }
          changeIndexSelection(index);
        },
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(color: AppColor.secondaryColor),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Hub'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_outlined), label: 'Profile'),
        ]);
  }
}
