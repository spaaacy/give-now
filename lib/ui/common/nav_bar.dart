import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'nav_bar_state.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<NavBarState>(context);
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
      currentIndex: state.selectedIndex,
      selectedItemColor: Colors.black,
      iconSize: 40,
      onTap: (index) => state.selectedIndex = index,
      elevation: 10,
    );
  }
}
