import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:provider/provider.dart';

class MayBankHP extends StatelessWidget {
  MayBankHP({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Maybank Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Charity Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Settings Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Maybank Home Page'),
          backgroundColor: Colors.green),
      body: Center(
        child: _widgetOptions.elementAt(homePageProvider.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Charity',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Settings',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: homePageProvider.selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: (index) => homePageProvider.selectedIndex = index,
          elevation: 5),
    );
  }
}
