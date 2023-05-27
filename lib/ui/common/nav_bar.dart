import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'nav_bar_state.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<NavBarState>(context);
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 2, 66, 109),
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_work_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.house_rounded),
          label: 'Charity',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: state.selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white30,
      iconSize: 40,
      onTap: (index) => state.selectedIndex = index,
      elevation: 10,
    );
  }
}
