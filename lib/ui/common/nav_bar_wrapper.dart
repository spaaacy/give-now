import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarWrapper extends StatelessWidget {
  const NavBarWrapper({super.key});
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      //body: Center(child: _widgetOptions.elementAt(homePageProvider.selectedIndex),),
    );
  }
}
