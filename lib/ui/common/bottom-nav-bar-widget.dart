import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page/home_page_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
            icon: Icon(Icons.home_work_rounded),
            label: 'Home',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logo-charity-1.png',
              width: 39,
              height: 39,
            ),
            label: 'Charity',
            backgroundColor: Colors.yellow),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.blue,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: homePageProvider.selectedIndex,
      selectedItemColor: Colors.black,
      iconSize: 40,
      onTap: (index) => homePageProvider.selectedIndex = index,
      elevation: 10,
    );
  }
}
